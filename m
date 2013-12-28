From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Race and segmentation fault in pthread_kill() vs thread teardown
Date: Sun, 29 Dec 2013 02:11:34 +1300
Message-ID: <52BECE06.30001@gmail.com>
References: <305581948.26980.1380684877897.JavaMail.zimbra@efficios.com> <675415986.27031.1380686764309.JavaMail.zimbra@efficios.com> <mvm8uyc2itw.fsf@hawking.suse.de> <1497173819.27140.1380715480773.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-46120-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-##L=##H@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <1497173819.27140.1380715480773.JavaMail.zimbra@efficios.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andreas Schwab <schwab@suse.de>
Cc: mtk.manpages@gmail.com, David Miller <davem@davemloft.net>, libc-alpha@sourceware.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-man@vger.kernel.org, Roland McGrath <roland@hack.frob.com>
List-Id: linux-man@vger.kernel.org

On 10/03/13 01:04, Mathieu Desnoyers wrote:
> ----- Original Message -----
>> From: "Andreas Schwab" <schwab@suse.de>
>> To: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>
>> Cc: "David Miller" <davem@davemloft.net>, libc-alpha@sourceware.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
>> Sent: Wednesday, October 2, 2013 4:11:23 AM
>> Subject: Re: Race and segmentation fault in pthread_kill() vs thread teardown
>>
>> The POSIX spec is pretty clear:
>>
>>  If an application attempts to use a thread ID whose lifetime has ended,
>>  the behavior is undefined.
>>
>> I'd suggest to file a bug report with the Austin group wrt to the
>> wording in pthread_kill.
> 
> CCing man pages maintainers,
> 
> Interestingly enough, the specification has been updated:
> 
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/pthread_kill.html
> 
> to remove the ESRCH return value in
> 
> Issue 7
>   Austin Group Interpretation 1003.1-2001 #142 is applied, removing the [ESRCH] error condition.
> 
> It looks like a discrepancy between the spec and the man page that causes this confusion. We might want to update pthread_kill(3), keeping ESRCH documented, but clearly marked as deprecated, and clarify that calling pthread_kill() on a non-existing thread is undefined.
> 
> We should probably remove this part entirely:
> 
> "      but error checking is still per‐
>        formed; this can be used to check for the existence of a thread ID."
> 
> Thoughts ?

Mathieu, et al.

I applied the patch below. Look okay to you?

Cheers,

Michael

diff --git a/man3/pthread_kill.3 b/man3/pthread_kill.3
index 674168f..bbf5573 100644
--- a/man3/pthread_kill.3
+++ b/man3/pthread_kill.3
@@ -47,8 +47,7 @@ The signal is asynchronously directed to
 
 If
 .I sig
-is 0, then no signal is sent, but error checking is still performed;
-this can be used to check for the existence of a thread ID.
+is 0, then no signal is sent, but error checking is still performed.
 .SH RETURN VALUE
 On success,
 .BR pthread_kill ()
@@ -58,13 +57,8 @@ on error, it returns an error number, and no signal is sent.
 .TP
 .B EINVAL
 An invalid signal was specified.
-.TP
-.B ESRCH
-No thread with the ID
-.I thread
-could be found.
 .SH CONFORMING TO
-POSIX.1-2001.
+POSIX.1-2008.
 .SH NOTES
 Signal dispositions are process-wide:
 if a signal handler is installed,
@@ -72,6 +66,19 @@ the handler will be invoked in the thread
 .IR thread ,
 but if the disposition of the signal is "stop", "continue", or "terminate",
 this action will affect the whole process.
+
+POSIX.1-2008 recommends that if an implementation detects the use
+of a thread ID after the end of its lifetime,
+.BR pthread_kill ()
+should return the error
+.BR ESRCH .
+The glibc implementation returns this error in the cases where
+an invalid thread ID can be detected.
+But note also that POSIX says that an attempt to use a thread ID whose
+lifetime has ended produces undefined behavior,
+and an attempt to use an invalid thread ID in a call to
+.BR pthread_kill ()
+can, for example, cause a segmentation fault.
 .SH SEE ALSO
 .BR kill (2),
 .BR sigaction (2),
