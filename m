From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] pthread_rwlockattr_setkind_np.3: Remove bug notes.
Date: Sat, 17 Nov 2018 07:42:16 +0100
Message-ID: <7b5e76b8-2a67-721e-9d54-ce4fb567162f@gmail.com>
References: <b6d241af-1d89-f6f2-e19b-239cc9c6d98f@redhat.com>
 <20181115152114.7amsm43s4gxxtxvd@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-97331-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <20181115152114.7amsm43s4gxxtxvd@crack.deadbeast.net>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>, Carlos O'Donell <carlos@redhat.com>
Cc: mtk.manpages@gmail.com, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 11/15/18 4:21 PM, G. Branden Robinson wrote:
> At 2018-11-15T10:03:41-0500, Carlos O'Donell wrote:
>> diff --git a/man3/pthread_rwlockattr_setkind_np.3 b/man3/pthread_rwlockattr_setkind_np.3
>> index 3cca7d864..6b2b8db39 100644
>> --- a/man3/pthread_rwlockattr_setkind_np.3
>> +++ b/man3/pthread_rwlockattr_setkind_np.3
> [...]
>> +.\" Here is the relevant wording:
>> +.\"
>> +.\"     A thread may hold multiple concurrent read locks on rwlock (that is,
>> +.\"     successfully call the pthread_rwlock_rdlock() function n times). If
>> +.\"     so, the thread must perform matching unlocks (that is, it must call
>> +.\"     the pthread_rwlock_unlock() function n times).
>> +.\"
>> +.\" By making write-priority work correctly, I broke the above requirement,
>> +.\" because. I had no clue that recursive read locks are permissible.
>               ^
> This period is not in the original quotation and grammatically doesn't
> belong there.

Fixed.

Thanks, Branden.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
