From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ptrace(2) man page
Date: Thu, 18 Apr 2013 11:25:16 +0200
Message-ID: <CAKgNAkgNWcgO=0hkn2pytk6MZ40vE=vN1T6JJ6rEvt53kW9-tw@mail.gmail.com>
References: <20130417113933.GA11499@osiris>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130417113933.GA11499@osiris>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: Andreas Arnez <arnez-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Heiko,

On Wed, Apr 17, 2013 at 1:39 PM, Heiko Carstens
<heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Michael,
>
> we are just wondering where we should document the s390 specific ptrace
> interface.
> The natural answer seems to be "in the man page", however when reading the
> ptrace(2) man page it hardly mentions any architecture dependent details.
>
> Especially the _exact_ semantics of each ptrace command including all data
> structures etc. are missing.
>
> In the kernel at least powerpc has Documentation/powerpc/ptrace.txt which
> seems to go into detail.
>
> So, what do you think? Should these architecture specific details go
> into the ptrace(2) man page?
> Or somewhere else? Like e.g. Documentation/<arch>/ptrace.txt in the kernel?
> Or maybe an arch specific "sub" man page like e.g. ptrace.<arch>?

I am not sure, mainly because I am not familiar with the extent of the
architecture-specific variation in ptrace(2). I do see that there is
just a very little arch-specific detail in the man page (x86, SPARC).
I am not (yet) sure of the way forward. I have CCed Denys Vlasenko,
since in recent times he has done a lot of work on this page, and I
assume has a lot of familiarity with the various arch-specific
details. Perhaps he has an opinion.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
