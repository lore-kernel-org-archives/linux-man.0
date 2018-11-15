From: Carlos O'Donell <carlos@redhat.com>
Subject: [patch] pthread_rwlockattr_setkind_np.3: Remove bug notes.
Date: Thu, 15 Nov 2018 10:03:41 -0500
Message-ID: <b6d241af-1d89-f6f2-e19b-239cc9c6d98f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-97258-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>
Cc: GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

The notes in pthread_rwlockattr_setkind_np.3 imply there is a bug
in glibc's implementation of PTHREAD_RWLOCK_PREFER_WRITER_NP (a
non-portable constant anyway), but this is not true. The implementation
of PTHREAD_RWLOCK_PREFER_WRITER_NP is made almost impossible by the
POSIX standard requirement that reader locks be allowed to be recursive,
and that requirement makes writer preference deadlock without an impossibly
complex requirement that we track all reader locks. Therefore the only
sensible solution was to add PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP
and disallow recursive reader locks if you want writer preference.

This patch removes the bug description and documents the current state
and recommendations for glibc. I have also updated bug 7057 with this
information, answering Steven Munroe's almost 10 year old question :-)
I hope Steven is enjoying his much earned retirement.

Tested on master.

Please apply to master.

Should we move the glibc discussion to some footnote? Some libc may be
able to implement the requirement to avoid deadlocks in the future, but
I doubt it (fundamental CS stuff).

diff --git a/man3/pthread_rwlockattr_setkind_np.3 b/man3/pthread_rwlockattr_setkind_np.3
index 3cca7d864..6b2b8db39 100644
--- a/man3/pthread_rwlockattr_setkind_np.3
+++ b/man3/pthread_rwlockattr_setkind_np.3
@@ -79,7 +79,31 @@ starved.
 .B PTHREAD_RWLOCK_PREFER_WRITER_NP
 This is intended as the write lock analog of
 .BR PTHREAD_RWLOCK_PREFER_READER_NP .
-But see BUGS.
+This is ignored by glibc because the POSIX requirement to support
+recursive writer locks would cause this option to create trivial
+deadlocks; instead use
+.B PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP
+which ensures the application developer will not take recursive
+read locks thus avoiding deadlocks.
+.\" ---
+.\" Here is the relevant wording:
+.\"
+.\"     A thread may hold multiple concurrent read locks on rwlock (that is,
+.\"     successfully call the pthread_rwlock_rdlock() function n times). If
+.\"     so, the thread must perform matching unlocks (that is, it must call
+.\"     the pthread_rwlock_unlock() function n times).
+.\"
+.\" By making write-priority work correctly, I broke the above requirement,
+.\" because. I had no clue that recursive read locks are permissible.
+.\"
+.\" If a thread which holds a read lock tries to acquire another read lock,
+.\" and now one or more writers is waiting for a write lock, then the algorithm
+.\" will lead to an obvious deadlock. The reader will be suspended, waiting for
+.\" the writers to acquire and release the lock, and the writers will be
+.\" suspended waiting for every existing read lock to be released.
+.\" ---
+.\" http://sources.redhat.com/ml/libc-alpha/2000-01/msg00055.html
+.\" https://sourceware.org/bugzilla/show_bug.cgi?id=7057
 .TP
 .B PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP
 Setting the lock kind to this
@@ -115,17 +139,5 @@ functions first appeared in glibc 2.1.
 .SH CONFORMING TO
 These functions are non-standard GNU extensions;
 hence the suffix "_np" (nonportable) in the names.
-.SH BUGS
-Setting the value read-write lock kind to
-.BR  PTHREAD_RWLOCK_PREFER_WRITER_NP
-results in the same behavior as setting the value to
-.BR PTHREAD_RWLOCK_PREFER_READER_NP .
-As long as a reader thread holds the lock, the thread holding a
-write lock will be starved.
-Setting the lock kind to
-.BR PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP
-allows writers to run, but, as the name implies a writer
-may not lock recursively.
-.\" http://sourceware.org/bugzilla/show_bug.cgi?id=7057
 .SH SEE ALSO
 .BR pthreads (7)
---

Cheers,
Carlos.
