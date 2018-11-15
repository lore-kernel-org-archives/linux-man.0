From: Carlos O'Donell <carlos@redhat.com>
Subject: Re: [patch] pthread_rwlockattr_setkind_np.3: Remove bug notes.
Date: Thu, 15 Nov 2018 16:57:15 -0500
Message-ID: <d2253870-7c94-b9f8-9108-df2ef955058c@redhat.com>
References: <b6d241af-1d89-f6f2-e19b-239cc9c6d98f@redhat.com>
 <20181115152114.7amsm43s4gxxtxvd@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-97291-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <20181115152114.7amsm43s4gxxtxvd@crack.deadbeast.net>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 11/15/18 10:21 AM, G. Branden Robinson wrote:
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

My mistake. It should not be there, I must have added it by accident when
I wrapped the text from the email.

> Is the Austin Group aware of the larger issue?  It seems reasonable to
> assume that they don't intend to mandate that system implementors
> resolve an unsolved problem in computer science. 

In a sense this isn't an Austin Group issue.

The POSIX interfaces do not allow you to specify a writer preference,
and by default can lead to writer starvation.

You might consider TPS with priority scheduling to allow such writers
of higher priority to have preference, but we don't implement that in
glibc (see issue #1111 below).

The writer preference was added by glibc to mirror the reader preference.
The writer preference defaults to doing nothing, because it is believed
that doing anything *and* supporting recursive readlocks leads to deadlock.
Therefore to make it clear to developers that you *must* never use
recursive read locks a 3rd constant was provided for the rwlock kind.

At a high level the Austin Group *is* aware of the issue.

http://austingroupbugs.net/view.php?id=720
In issue #720 it was ruled that read locks are recursive, and write
locks are not recursive.

http://austingroupbugs.net/view.php?id=1111
In issue #1111 it is discussed that only through TPS can you achieve
writer preference at the cost of never allowing recursive read locks
on that lock. See "Description" for the bug, item (2).

Thus the most directly applicable issue was #1111, since it involved
TPS and writer threads that can preempt reader threads, but even
there the consideration was that the deadlocks caused by the recursive
reader locks were a program bug.

In glibc we took the position that we would simply not allow the
deadlocks to occur. Your choices in glibc are:

(a) PTHREAD_RWLOCK_PREFER_READER_NP
- Prefer readers.
- Support recursive read locks.

(b) PTHREAD_RWLOCK_PREFER_WRITER_NP (misleading)
- Prefer readers.
- Support recursive read locks.
- Results in writer starvation but *not* deadlocks.

(c) PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP
- Prefer writers.
- Ban recursive read locks.
- Results in reader starvation.

Does that answer your question?

-- 
Cheers,
Carlos.
