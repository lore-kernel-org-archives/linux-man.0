From: Andreas Arnez <arnez-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: ptrace(2) man page
Date: Wed, 24 Apr 2013 16:47:26 +0200
Message-ID: <878v48htoh.fsf@br87z6lw.de.ibm.com>
References: <20130417113933.GA11499@osiris>
	<CAKgNAkgNWcgO=0hkn2pytk6MZ40vE=vN1T6JJ6rEvt53kW9-tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgNWcgO=0hkn2pytk6MZ40vE=vN1T6JJ6rEvt53kW9-tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Thu, 18 Apr 2013 11:25:16 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hello Heiko,
>
> On Wed, Apr 17, 2013 at 1:39 PM, Heiko Carstens
> <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
>> ...
>> So, what do you think? Should these architecture specific details go
>> into the ptrace(2) man page?
>> Or somewhere else? Like e.g. Documentation/<arch>/ptrace.txt in the kernel?
>> Or maybe an arch specific "sub" man page like e.g. ptrace.<arch>?
>
> I am not sure, mainly because I am not familiar with the extent of the
> architecture-specific variation in ptrace(2). I do see that there is
> just a very little arch-specific detail in the man page (x86, SPARC).
> I am not (yet) sure of the way forward.

Per architecture there would potentially be a few hundred lines of
additional documentation.  For example, the various register sets could
be enumerated and their layout summarized.  And all the
architecture-specific ptrace requests could be explained.

> I have CCed Denys Vlasenko, since in recent times he has done a lot of
> work on this page, and I assume has a lot of familiarity with the
> various arch-specific details. Perhaps he has an opinion.

Denys, do you have an opinion?

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
