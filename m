From: Olivier TARTROU <olivier.tartrou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] termios.3: Add missing details on behaviour of PARMRK
Date: Thu, 26 Nov 2015 23:47:15 +0100
Message-ID: <CAMEd9Sjna4Jq4wHyV8ZV349K1DRuiinDTh=LXpiydQ3pXiwKTw@mail.gmail.com>
References: <CAMEd9SiB39hjzue=P6m-nJhSAd5=PcnL3NtoG3S6f+iiLCwEbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMEd9SiB39hjzue=P6m-nJhSAd5=PcnL3NtoG3S6f+iiLCwEbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Nov 5, 2015 at 10:38 PM, Olivier TARTROU
<olivier.tartrou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> For a serial terminal, with a specific configuration, input bytes with
> value 0377 are passed to the program as two bytes, 0377 0377.
>
> This (correct) behaviour is described in the documentation of the GNU
> C Library (https://www.gnu.org/software/libc/manual/html_node/Input-Modes.html#Input-Modes)
> but not in the termios.3 man page.
>
> Problematic configuration: INPCK set, IGNPAR not set, PARMRK set,
> ISTRIP not set.
>
> This man page problem affects several users. Examples:
> * http://sourceforge.net/p/ftdi-usb-sio/mailman/message/4079724/
> * http://mailman.uclinux.org/pipermail/uclinux-dev/2006-November/040984.html
> * ...
>
> The patch below corrects this problem. This patch applies to release 4.02.
>
>
> --- old/termios.3       2015-11-04 20:32:56.117200840 +0100
> +++ new/termios.3       2015-11-04 23:31:23.165191198 +0100
> @@ -36,6 +36,8 @@
>  .\"     Added a section on canonical and noncanonical mode.
>  .\"     Enhanced the discussion of "raw" mode for cfmakeraw().
>  .\"     Document CMSPAR.
> +.\" 2015-11-04, Olivier TARTROU <olivier.tartrou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> +.\"     Reworked description of PARMRK from
> https://www.gnu.org/software/libc/manual/html_node/Input-Modes.html#Input-Modes
>  .\"
>  .TH TERMIOS 3 2015-03-02 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> @@ -133,8 +135,17 @@
>  Ignore framing errors and parity errors.
>  .TP
>  .B PARMRK
> -If \fBIGNPAR\fP is not set, prefix a character with a parity error or
> -framing error with \\377 \\0.
> +If this bit is set, input bytes with parity or framing errors are
> +marked when passed to the program. This bit is meaningful only when
> +\fBINPCK\fP is set and \fBIGNPAR\fP is not set.
> +The way erroneous bytes are marked is with two preceding bytes,
> +\\377 and \\0. Thus, the program actually reads three bytes for one
> +erroneous byte received from the terminal.
> +If a valid byte has the value \\377, and \fBISTRIP\fP (see below) is
> +not set, the program might confuse it with the prefix that marks a
> +parity error. So a valid byte \\377 is passed to the program as two
> +bytes, \\377 \\377, in this case.
> +
>  If neither \fBIGNPAR\fP nor \fBPARMRK\fP
>  is set, read a character with a parity error or framing error
>  as \\0.
>
>
> Best regards,
>
> Olivier TARTROU
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
