From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] ptrace.2: Add note regarding 'struct user'
Date: Wed, 21 May 2008 19:53:59 +0200
Message-ID: <483461B7.5090706@gmail.com>
References: <20080517064309.gnqp888k2s8wo4sk@imap.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080517064309.gnqp888k2s8wo4sk-FJGp5E75HVmZamtmwQBW5tBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anoop <acv-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Anoop, Roland,



Anoop wrote:
> 
> A few days back Roland McGrath discussed about the ptrace
> PTRACE_PEEKUSER behavior @ http://lkml.org/lkml/2008/5/8/375
> 
> Thought that adding a note saying - the offsets and data returned might
> not match with the definition of struct user - will help.
> 
> Signed-off-by: Anoop Vijayan <acv-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> 
> --- man-pages-2.79/man2/ptrace.2.orig   2008-05-17 12:54:50.000000000 +0530
> +++ man-pages-2.79/man2/ptrace.2        2008-05-17 13:45:53.000000000 +0530
> @@ -138,7 +138,7 @@ The word is returned as the result of th
>  .BR ptrace ()
>  call.
>  Typically the offset must be word-aligned, though this might vary by
> -architecture.  (\fIdata\fP is ignored.)
> +architecture. See NOTES. (\fIdata\fP is ignored.)
>  .TP
>  .BR PTRACE_POKETEXT ", " PTRACE_POKEDATA
>  Copies the word
> @@ -454,7 +454,9 @@ behavior.
>  the process with PID 1, may not be traced.
>  .LP
>  The layout of the contents of memory and the USER area are quite OS- and
> -architecture-specific.
> +architecture-specific. The offset supplied and the data returned might
> +not entirely match with the definition of
> +.I struct user
>  .LP
>  The size of a "word" is determined by the OS variant
>  (e.g., for 32-bit Linux it is 32 bits, etc.).

Anoop -- I'll just ask for a second opinion here, since I'm not familiar with all the details.

Roland, does this change seem okay to you?

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
