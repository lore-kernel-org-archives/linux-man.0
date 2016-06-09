From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] utf-8: include RFC 3629 and clarify endianness which is
 left ambiguous
Date: Thu, 9 Jun 2016 10:22:50 +0200
Message-ID: <c5583675-8a1b-89c6-0888-848ce8fadff3@gmail.com>
References: <1432623186-26328-1-git-send-email-shawn@churchofgit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432623186-26328-1-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/26/2015 08:53 AM, Shawn Landden wrote:
> The endianness is suggested by the order the bytes are displayed, but the
> text is ambiguous.

Thanks, Shawn. Applied.

Cheers,

Michael


> ---
>  man7/utf-8.7 | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/utf-8.7 b/man7/utf-8.7
> index 597fad4..bbb016c 100644
> --- a/man7/utf-8.7
> +++ b/man7/utf-8.7
> @@ -133,12 +133,14 @@ The sequence to be used depends on the UCS code number of the character:
>  The
>  .I xxx
>  bit positions are filled with the bits of the character code number in
> -binary representation.
> +binary representation, most significant bit first (big-endian).
>  Only the shortest possible multibyte sequence
>  which can represent the code number of the character can be used.
>  .PP
>  The UCS code values 0xd800\(en0xdfff (UTF-16 surrogates) as well as 0xfffe and
> -0xffff (UCS noncharacters) should not appear in conforming UTF-8 streams.
> +0xffff (UCS noncharacters) should not appear in conforming UTF-8 streams. According
> +to RFC 3629 no point above U+10FFFF should be used, which limits characters to four
> +bytes.
>  .SS Example
>  The Unicode character 0xa9 = 1010 1001 (the copyright sign) is encoded
>  in UTF-8 as
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
