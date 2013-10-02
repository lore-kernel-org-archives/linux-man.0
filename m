From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: Race and segmentation fault in pthread_kill() vs thread
 teardown
Date: Wed, 2 Oct 2013 12:04:40 +0000 (UTC)
Message-ID: <1497173819.27140.1380715480773.JavaMail.zimbra@efficios.com>
References: <305581948.26980.1380684877897.JavaMail.zimbra@efficios.com> <675415986.27031.1380686764309.JavaMail.zimbra@efficios.com> <mvm8uyc2itw.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <libc-alpha-return-43282-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-##L=##H@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <mvm8uyc2itw.fsf@hawking.suse.de>
To: Andreas Schwab <schwab@suse.de>, Michael Kerrisk <mtk.manpages@gmail.com>
Cc: David Miller <davem@davemloft.net>, libc-alpha@sourceware.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

----- Original Message -----
> From: "Andreas Schwab" <schwab@suse.de>
> To: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>
> Cc: "David Miller" <davem@davemloft.net>, libc-alpha@sourceware.org, "Pau=
l E. McKenney" <paulmck@linux.vnet.ibm.com>
> Sent: Wednesday, October 2, 2013 4:11:23 AM
> Subject: Re: Race and segmentation fault in pthread_kill() vs thread tear=
down
>=20
> The POSIX spec is pretty clear:
>=20
>  If an application attempts to use a thread ID whose lifetime has ended,
>  the behavior is undefined.
>=20
> I'd suggest to file a bug report with the Austin group wrt to the
> wording in pthread_kill.

CCing man pages maintainers,

Interestingly enough, the specification has been updated:

http://pubs.opengroup.org/onlinepubs/9699919799/functions/pthread_kill.html

to remove the ESRCH return value in

Issue 7
  Austin Group Interpretation 1003.1-2001 #142 is applied, removing the [ES=
RCH] error condition.

It looks like a discrepancy between the spec and the man page that causes t=
his confusion. We might want to update pthread_kill(3), keeping ESRCH docum=
ented, but clearly marked as deprecated, and clarify that calling pthread_k=
ill() on a non-existing thread is undefined.

We should probably remove this part entirely:

"      but error checking is still per=E2=80=90
       formed; this can be used to check for the existence of a thread ID."

Thoughts ?

Thanks,

Mathieu




>=20
> Andreas.
>=20
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint =3D 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D=
7
> "And now for something completely different."
>=20

--=20
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
