From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Test programs for math function bug reports
Date: Thu, 31 Jul 2008 13:24:57 +0200
Message-ID: <cfd18e0f0807310424x1895aba5td273c6c03503cda9@mail.gmail.com>
References: <cfd18e0f0807300739u3dc1982r339ce72896d5344f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0807300739u3dc1982r339ce72896d5344f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Jul 30, 2008 at 4:39 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi Andreas,
>
> By now you'll probably have noticed that I've started filing bug
> reports for the math functions.  (There's still quite a few to come.)
> You might also have noticed that I haven't included test code with
> each report.  The reason is that I have a script that generates test
> programs for the math functions.  You just supply the script with
> function name, type (float, long, long double), descriptions of
> arguments (if other than the default type), and it produces a C
> program of just under 400 lines that can be used to carry out various
> kinds of test, driven by command-line arguments.
>
> Should I include the generated test program in each bug report?

I got over my hesitation, and am attaching a test program to each bug report.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
