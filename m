From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man 7 ascii confusion
Date: Wed, 26 Feb 2014 11:06:17 +0100
Message-ID: <CAKgNAki09-i1TbG61kf6NBQ06bk4rZpRdcg8RqBR0YTeuVU5_A@mail.gmail.com>
References: <20131122044518.GA11154@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131122044518.GA11154-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Duncan de Wet <duncandewet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Duncan,

On Fri, Nov 22, 2013 at 5:45 AM, Duncan de Wet <duncandewet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Manpages version 3.44-0ubuntu1 distribution Linux Mint 15.
>
> In man 7 ascii, there is the following sentence:
>
>> Many 8-bit codes (such as ISO 8859-1, the Linux default character set)
>> contain ASCII as their lower half.
>
> Locales now use UTF-8 by default. This sentence should probably be
> changed to something explaining how UTF-8 works, like:
>
>> Many 8-bit codes contain ASCII as their lower half. The Linux default
>> character set, UTF-8, fits thousands of characters through non-ASCII
>> characters using more than one upper-half byte.
>
> Or something like that, I'm no expert.

I agree that something should be fixed, but simplest I think is to
remove mention of 8859-1 as the default. There is already a utf-8(7)
page that explains UTF-8 at some length.

I applied the patch below, and I'll also add utf-8(7) under SEE ALSO.

Cheers,

Michael


diff --git a/man7/ascii.7 b/man7/ascii.7
index 5f064c1..88979dc 100644
--- a/man7/ascii.7
+++ b/man7/ascii.7
@@ -38,8 +38,7 @@ ascii \- ASCII character set encoded in octal,
decimal, and hexadecimal
 .SH DESCRIPTION
 ASCII is the American Standard Code for Information Interchange.
 It is a 7-bit code.
-Many 8-bit codes (such as ISO 8859-1, the
-Linux default character set) contain ASCII as their lower half.
+Many 8-bit codes (e.g., ISO 8859-1) contain ASCII as their lower half.
 The international counterpart of ASCII is known as ISO 646.
 .LP
 The following table contains the 128 ASCII characters.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
