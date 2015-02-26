From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] user_namespaces.7: Fix two groff warnings for escape
 character ignored
Date: Thu, 26 Feb 2015 13:26:11 +0100
Message-ID: <CAKgNAkiKPbhjJrT+Pf4hPhGX5og_zA2Ay3-GLP2+9U87HfKaOA@mail.gmail.com>
References: <1424939021-3059-1-git-send-email-saulery@free.fr>
 <54EEE236.1000500@gmail.com> <20150226093938.GA3331@free.fr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150226093938.GA3331-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?St=C3=A9phane_Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello St=C3=A9phane

On 26 February 2015 at 10:39, St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org> wr=
ote:
> Hi Michael,
>
> Le jeudi 26 f=C3=A9vrier 2015 =C3=A0 10:07:02, Michael Kerrisk (man-p=
ages) a =C3=A9crit :
>>
>> When do you see these warnings? (I'm not seeing them.)
>
> I use the command bellow for "debugging" manpages :
>
>    $ GROFF_ENCODING=3Dutf8 groff -b -ww -z -mandoc

Thanks. I see now that the problem was a typo (twice). I applied the
right fix, below. Thanks for the report.

Cheers,

Michael


diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
index 4baf7aa..0a670a6 100644
--- a/man7/user_namespaces.7
+++ b/man7/user_namespaces.7
@@ -439,12 +439,12 @@ maps to a range starting at 0 in the
(nonexistent) parent namespace,
 and the length of the range is the largest 32-bit unsigned integer.
 (This deliberately leaves 4294967295 (the 32-bit signed \-1 value) unm=
apped.
 This is deliberate:
-.IR "(uid_t)\ -\1"
+.IR "(uid_t)\ \-1"
 is used in several interfaces (e.g.,
 .BR setreuid (2))
 as a way to specify "no user ID".
 Leaving
-.IR "(uid_t)\ -\1"
+.IR "(uid_t)\ \-1"
 unmapped and unusable guarantees that there will be no
 confusion when using these interfaces.
 .\"


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
