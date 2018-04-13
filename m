From: Carlos O'Donell <carlos@redhat.com>
Subject: Re: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Fri, 13 Apr 2018 08:22:59 -0500
Message-ID: <45d88eea-463c-ae07-1fe0-48c000954cc7@redhat.com>
References: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
 <adb4d22e-f0b9-584d-5a61-c4290038b03b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-91537-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <adb4d22e-f0b9-584d-5a61-c4290038b03b@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Cc: Florian Weimer <fweimer@redhat.com>, Zack Weinberg <zackw@panix.com>, Rical Jasan <rj@2c3t.io>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 04/13/2018 04:34 AM, Michael Kerrisk (man-pages) wrote:
> On 04/12/2018 09:05 PM, Carlos O'Donell wrote:
>> The distribution may choose not to support _XOPEN_CRYPT in the
>> case that the distribution has transitioned from glibc crypt to
>> libxcrypt.
>>
>> Signed-off-by: Carlos O'Donell <carlos@redhat.com>
> 
> Thanks, Carlos. I applied the patch, but rather than having the
> exact same text in both pages, I simply added a cross reference 
> in encrypt(3).

That makes sense. I thought about exactly the same thing, but
decided that I'd let you use your liberty as editor to make that
decision upon review.

Thanks for applying the fixes.

Consider my fixes to posixoptions.7 as penance for complicating
encrypt.3. We have users going through that transition now for
us in Fedora (libcrypt -> libxcrypt), and we wanted to provide
some kind of note about the APIs moving. The changes are not
yet in upstream glibc, but may eventually go there, at which
point the note will still be valid.

We will need similar notes I think for our SunRPC -> TIRPC
transition, touching the various RPC man pages and explaining
any differences.

-- 
Cheers,
Carlos.
