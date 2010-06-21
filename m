From: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re:
Date: Mon, 21 Jun 2010 14:05:53 -0700
Message-ID: <4C1FD431.6030505@gmail.com>
References: <460216361116404BB61933403540E169B645A3E596@ushqwmb03>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <460216361116404BB61933403540E169B645A3E596@ushqwmb03>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bob Eggers <Bob.Eggers-C65YXLrEp3M@public.gmane.org>
Cc: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I believe that's the correct result for a NULL-terminated string of length 1.

- bog

On 06/21/2010 01:30 PM, Bob Eggers wrote:
> I noticed an error in and example on the man page for strncpy(). The page is http://www.kernel.org/doc/man-pages/online/pages/man3/strncpy.3.html
> 
> The error is in the section, "NOTES", specifically in the code example after the text:
> 
>       If there is no terminating null byte in the first n characters of src,
>        strncpy() produces an unterminated string in dest.  Programmers often prevent
>        this mistake by forcing termination as follows:
> 
>            strncpy(buf, str, n);
>            if (n > 0)
>                buf[n - 1]= '\0';
> 
> Substituting 1 for n and "123" for str, this would equate to:
> 
>            strncpy(buf, "123", 1);  // buf is now "1"
>            if (1 > 0)
>                buf[1 - 1]= '\0';                // buf is now ""
> 
> Bob Eggers--
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Bill O. Gallmeister
bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
http://geekwhisperer.blogspot.com
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
