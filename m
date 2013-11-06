From: Basile Starynkevitch <basile-VdE74OAlGqnvXjIo7pOF+l6hYfS7NtTn@public.gmane.org>
Subject: signal(7) should mention sig_atomic_t
Date: Wed, 06 Nov 2013 11:32:55 +0100
Message-ID: <1383733975.31297.16.camel@glinka.lesours>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Thanks for your man pages project!

I believe that the following paragraphs could be added to signal(7),
perhaps at the end of the  Async-signal-safe functions subsection:

####
    A common way to code a signal handler respecting the
async-signal-safe requirements is to declare some global or static
volatile variable of sig_atomic_t type, e.g:

    volatile sig_atomic_t got_signal;

The sig_atomic_t type (defined in <signal.h>) is some integral type
which can be atomically tested and set w.r.t. signals. Then the handler
is just setting that variable, and the program can test (outside of the
handler), at suitable places in the code, if that variable is set.
####

I am not a native English speaker, so feel free to improve or shorten
the above. But I believe that volatile sig_atomic_t should be mentioned
somewhere in signal(7)

Regards.



-- 
Basile STARYNKEVITCH         http://starynkevitch.net/Basile/
email: basile<at>starynkevitch<dot>net mobile: +33 6 8501 2359
8, rue de la Faiencerie, 92340 Bourg La Reine, France
*** opinions {are only mine, sont seulement les miennes} ***


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
