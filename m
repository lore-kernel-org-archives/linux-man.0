From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] man3/crypt.3: Correct note on key portion significance
Date: Mon, 24 May 2010 07:20:01 +0200
Message-ID: <AANLkTikiFLwEMWKkkoUOG06ziP4NfpD6QGUBeQ8Dmq2y@mail.gmail.com>
References: <20100418171718.GB25938@zuul.luon.net> <20100511013550.GD16800@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100511013550.GD16800-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Moreaux <marcelm-MO7g/Hy4xaE@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Petr,

On Tue, May 11, 2010 at 3:35 AM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> As Marcel Moreaux notes:
>
>> The Linux manpage for crypt()[1] contains the following statement as=
 the
>> last sentence of the NOTES section:
>>
>> =A0 =A0 In the SHA implementation the entire key is significant (ins=
tead of
>> =A0 =A0 only the first 8 bytes in MD5).
>>
>> It should probably say "DES" where it says "MD5" (and maybe "MD5/SHA=
"
>> where it says "SHA"), because in MD5 password hashing, the entire ke=
y is
>> significant, not just the first 8 bytes.
>
> This patch fixes the wording.

Thanks. Applied for 3.25.

Cheers,

Michael


> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> ---
>
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index 1139792..aeaf873 100644
> --- a/man3/crypt.3
> +++ b/man3/crypt.3
> @@ -217,10 +217,10 @@ SHA-512 | 86 characters
>
> =A0The characters in "\fIsalt\fP" and "\fIencrypted\fP" are drawn fro=
m the set
> =A0[\fBa\fP\(en\fBzA\fP\(en\fBZ0\fP\(en\fB9./\fP].
> -In the SHA implementation the entire
> +In the MD5 and SHA implementations the entire
> =A0.I key
> =A0is significant (instead of only the first
> -8 bytes in MD5).
> +8 bytes in DES).
> =A0.SH "SEE ALSO"
> =A0.BR login (1),
> =A0.BR passwd (1),
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
