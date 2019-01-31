From: Theodore Dubois <tblodt@icloud.com>
Subject: edge case posix file lock deadlock detection
Date: Wed, 30 Jan 2019 19:31:10 -0800
Message-ID: <8E383B31-AB1C-449E-8AC4-DE20228CA8FF@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kernelnewbies-bounces@kernelnewbies.org>
List-Unsubscribe: <https://lists.kernelnewbies.org/mailman/options/kernelnewbies>,
 <mailto:kernelnewbies-request@kernelnewbies.org?subject=unsubscribe>
List-Archive: <http://lists.kernelnewbies.org/pipermail/kernelnewbies/>
List-Post: <mailto:kernelnewbies@kernelnewbies.org>
List-Help: <mailto:kernelnewbies-request@kernelnewbies.org?subject=help>
List-Subscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
 <mailto:kernelnewbies-request@kernelnewbies.org?subject=subscribe>
Errors-To: kernelnewbies-bounces@kernelnewbies.org
To: Theodore Dubois <tblodt@icloud.com>
Cc: linux-man@vger.kernel.org, kernelnewbies@kernelnewbies.org
List-Id: linux-man@vger.kernel.org

I'm having trouble figuring out how the kernel handles a particular case in deadlock detection on posix file locks. Here's the scenario:

PID 1: locks byte 2
PID 3: locks byte 0
PID 2: locks byte 10
PID 1: locks byte 10
PID 2: locks bytes 0-2 inclusive

The last step fails with EDEADLK, but I'm not sure how that is detected. The specified range conflicts with two different locks, and the first loop in posix_lock_inode would find whichever one comes first in the linked list, and pass that to the deadlock detector.

If the lock on byte 2 comes first in the list, a cycle would be found between the lock on byte 2 and the lock on byte 10. But if the lock on byte 0 comes first, the deadlock detector would return NULL from what_owner_is_waiting_for on that lock since PID 3 has no other locks, and immediately succeed.

What am I missing?

Thanks,
~Theodore
