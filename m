From: Robin Kuzmin <kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: Man page (sigaltstack.2) cases a question.
Date: Wed, 7 Feb 2018 14:59:46 -0800
Message-ID: <CAAztzVF3eU0KwLhh-nZF1CHpx=Ai4tg=9Chx8CdsbX2yodNkBA@mail.gmail.com>
References: <CAAztzVEPdxtd2GwHD8x3GvQfJTrakGGS6rKi06LCO4e8Keg=7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAztzVEPdxtd2GwHD8x3GvQfJTrakGGS6rKi06LCO4e8Keg=7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

(Sorry, my previous e-mail contained an HTML fragments/links and was
not delivered to one or more recipients. Trying again as a plain text)
See my previous e-mail below.

Robin Kuzmin
kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

---------- Forwarded message ----------
From: Robin Kuzmin <kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Wed, Feb 7, 2018 at 2:53 PM
Subject: Man page (sigaltstack.2) cases a question.
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Michael Kerrisk (man-pages)"
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


FYI, see my previous e-mail below.

Robin Kuzmin
kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

---------- Forwarded message ----------
From: Robin Kuzmin <kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Thu, Feb 1, 2018 at 4:27 PM
Subject: (The subj was wrong)
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


Hi Michael,
I have a question about the man page
http://man7.org/linux/man-pages/man2/sigaltstack.2.html
Is it possible to get the man page updated with the right (your)
answer to a question that I asked on the stackoverflow.com? (I'm
repeating the question below)
I also see one reply there on stackoverflow.com that I'm about to try,
if you immediately see that the recommendation won't work then please
let me know.

---
How to make the SIGSEGV handler be launched on an alternate stack for
stack overflow case only?

My app uses a SIGSEGV (Segmentation Violation) signal handler
(registered with sigaction()).

When my app accesses a NULL pointer, my SIGSEGV handler gets a
control, prints (to the console and log) the stack trace of the
offending thread, and invokes the default signal handler which results
in the core dump (crash dump) generation. So when a crash is reported
by the testers, I quickly see in the log the offending thread stack
trace (without analyzing the core dump).

However in the stack overflow case my signal handler is not launched,
the app crashes (with silent log). While analyzing the core dump I (or
my colleagues) see that the crash has happened in the middle of the
correct code. It takes a significant time to understand that the stack
overflow was the reason of the crash. So I want at least a message
"Stack Overflow" in the log (in case of the stack overflow).

While reading the SIGALTSTACK(2) man page (NOTES section) I realize
that my signal handler is called on the stack of the offending thread,
that is why in case of the stack overflow the signal handler cannot be
called (there is no stack to call the signal handler). However it is
possible to run the signal handler on an alternate stack. This will
let my signal handler to log the message "Stack Overflow".

But the man page makes me think that if I switch my SIGSEGV handler to
use an alternate stack then the handler will ALWAYS be executed on an
alternate stack and will NOT be able to log the offending thread stack
trace for NULL-pointer-access case.

Hence the question: "How to make the SIGSEGV handler be launched on an
alternate stack for stack overflow case only (and on a currently
active stack for all other cases)?"

________________________________

To get the stack trace I use the following calls: backtrace(),
backtrace_symbols(),abi::__cxa_demangle().


Robin Kuzmin
kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org



---------- Forwarded message ----------
From: Mail Delivery Subsystem <mailer-daemon-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Date: Wed, Feb 7, 2018 at 2:53 PM
Subject: Delivery Status Notification (Failure)
To: kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Message may contain a virus

Your message wasn't delivered to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org because it
may contain a virus. Learn how to check for and prevent viruses.
The response from the remote server was:

550 5.7.1 Content-Policy reject msg: The message contains HTML
subpart, therefore we consider it SPAM or Outlook Virus. TEXT/PLAIN is
accepted.! BF:<U 0.500015>; S1750750AbeBGWxQ


Final-Recipient: rfc822; linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Action: failed
Status: 5.7.1
Remote-MTA: dns; vger.kernel.org. (209.132.180.67, the server for the
domain vger.kernel.org.)
Diagnostic-Code: smtp; 550 5.7.1 Content-Policy reject msg: The
message contains HTML subpart, therefore we consider it SPAM or
Outlook Virus.  TEXT/PLAIN is accepted.! BF:<U 0.500015>;
S1750750AbeBGWxQ
Last-Attempt-Date: Wed, 07 Feb 2018 14:53:16 -0800 (PST)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
