From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: STV_PROTECTED
Date: Wed, 9 Mar 2016 19:26:55 +0100
Message-ID: <CAKgNAkhMRK-UEDbE1_2qLd1wZYGT+_n7GUURPezd0AK=Q8xs0A@mail.gmail.com>
References: <20150929101411.GA17105@skagos.loria.fr> <56DF7669.70204@gmail.com>
 <20160309050136.GR6588@vapier.lan>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160309050136.GR6588-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gabriel Corona <gabriel.corona-Pj3lBMu8rt9bbU8NOSLlsg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 9 March 2016 at 06:01, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 09 Mar 2016 02:03, Michael Kerrisk (man-pages) wrote:
>> On 09/29/2015 12:14 PM, Gabriel Corona wrote:
>> > The elf manpage [2] claims that:
>> >
>> >> STV_PROTECTED   Not preemptible, not exported.
>> >
>> > However the System V gABI [1] claims that:
>> >
>> >> A symbol defined in the current component is protected if it is
>> >> visible in other components but not preemptable
>> >
>> > Should the manpage read something like:
>> >
>> >> STV_PROTECTED   Not preemptible but exported.
>> >
>> > [1] http://www.sco.com/developers/gabi/2003-12-17/ch4.symtab.html
>> >
>> > [2] http://man7.org/linux/man-pages/man5/elf.5.html
>>
>> I think you are right, but let's see if Mike might confirm,
>> since he originally added that text. (Mike, I suspect there
>> was a wordo here.)
>
> i didn't really author that content, but take it from elf.h in glibc:
> #define STV_PROTECTED   3               /* Not preemptible, not exported */
>
> and binutils says:
> #define STV_PROTECTED   3               /* Treat as STB_LOCAL inside current component */
>
> and llvm says:
>   STV_PROTECTED = 3   // Visible in other components but not preemptable
>
> gabi says:
> https://refspecs.linuxbase.org/elf/gabi4+/ch4.symtab.html
> A symbol defined in the current component is protected if it is visible in other
> components but not preemptable, meaning that any reference to such a symbol from
> within the defining component must be resolved to the definition in that
> component, even if there is a definition in another component that would preempt
> by the default rules. A symbol with STB_LOCAL binding may not have STV_PROTECTED
> visibility. If a symbol definition with STV_PROTECTED visibility from a shared
> object is taken as resolving a reference from an executable or another shared
> object, the SHN_UNDEF symbol table entry created has STV_DEFAULT visibility.
>
> solaris/oracle says:
> https://docs.oracle.com/cd/E26502_01/html/E26507/chapter6-79797.html
> A symbol that is defined in the current component is protected if the symbol is
> visible in other components, but cannot be preempted. Any reference to such a
> symbol from within the defining component must be resolved to the definition in
> that component. This resolution must occur, even if a symbol definition exists
> in another component that would interpose by the default rules. A symbol with
> STB_LOCAL binding will not have STV_PROTECTED visibility.
>
> but i think this ibm article is probably the most understandable:
> https://www.ibm.com/developerworks/aix/library/au-aix-symbol-visibility/
> The symbol is visible outside the current executable or shared object, but it
> may not be overridden. In other words, if a protected symbol in a shared library
> is referenced by an other code in the shared library, the other code will always
> reference the symbol in the shared library, even if the executable defines a
> symbol with the same name.
>
> so while "Not preemptible but exported" is more correct, i'm not sure it's
> still all that great.  maybe "Exported; not preemptible in current module." ?

Thanks for the detailed confirmation, Mike. I made the text:

                 STV_PROTECTED   Symbol is available in other modules,
                                 but  references  in  the local module
                                 always resolve to the local symbol.

Thanks for the report Gabriel!

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
