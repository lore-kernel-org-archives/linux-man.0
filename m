From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Bug in select_tut
Date: Sun, 25 Jan 2009 23:37:28 +1300
Message-ID: <cfd18e0f0901250237n60e96e68q76b8b3aaf422cacc@mail.gmail.com>
References: <4971E510.9050301@riot.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4971E510.9050301-O0gdCS+Gcp8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Kienzl <seb-O0gdCS+Gcp8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Sebastian,

On Sun, Jan 18, 2009 at 3:02 AM, Sebastian Kienzl <seb-O0gdCS+Gcp8@public.gmane.org> wrote:
> Hello!
>
> There's a bug in the select_tut man-page in the chapter "Combining Signal
> and Data Events", which should illustrate pselect()-usage.
>
> See the attachments for detailed information, proof-code and a proposed fix.
>
> Regards,
> Seb.
>
> /*
> This is a demonstration of how the code provided
> in the Linux man-page select_tut(2) / "Combining Signal and Data Events"
> for counting SIGCHLD-events is not correct.
>
> The problem is that the example-code assumes that
> normal signals get queued somehow, which is not the case; quote from
> signal(7):
>
>  "By contrast, if multiple instances of a standard signal are delivered
>  while that signal is currently blocked, then only one instance is queued."
>
> Bottom line:
>
> Setting a global flag when a signal has occured will do the job
> and that's what pselect() is intended for -- but counting the occurences
> of a standard signal as shown in the example DOES NOT WORK.

Thanks for your very thorough report.  I agree that the example in its
current form seems to be confused.  (And indeed, there are many things
taht I do not really like about this page, and I plan to clean some of
them up.)

> Compile and run this file to see how the example code will result in zombies
> if multiple SIGCHLDs are delivered at the same time;
> compile with -DCORRECT to get the correct solution for this case.
>
> See select_tut-badcount-fix.patch for a proposal to fix the documentation,.

However, what I am inclined to do is fix the program, rather than the
text.  I will send you a revised version in a moment; please take a
look at it.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
