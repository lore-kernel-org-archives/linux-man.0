From: Siddhesh Poyarekar <siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 11:35:14 +0530
Message-ID: <22f26755-f7f0-898a-ac74-3f6df92a22d7@sourceware.org>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
Reply-To: siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b3a962de-6703-d8b9-18f7-138185171475-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wednesday 19 April 2017 08:37 PM, Michael Kerrisk (man-pages) wrote:
> 1. If looking for a versioned symbol (NAME@VERSION), the DL will search
>    starting from the start of the link map ("namespace") until it finds the
>    first instance of either a matching unversioned NAME or an exact version
>    match on NAME@VERSION. Preloading takes advantage of the former case to
>    allow easy overriding of versioned symbols in a library that is loaded 
>    later in the link map.

I believe it is the other way around, i.e. it looks for the versioned
symbol first and if it is not found, link against the unversioned symbol
provided that it is public.

> 2. The version notation NAME@@VERSION denotes the default version
>    for NAME. This default version is used in the following places:
> 
>    a) At static link time, this is the version that the static
>       linker will bind to when creating the relocation record
>       that will be used by the DL.
>    b) When doing a dlsym() look-up on the unversioned symbol NAME.
>       (See check_match() in elf/dl-lookup.c)
> 
>    Is the default version used in any other circumstance?

Only (a) afaict, where do you see (2) happening?  Unversioned symbol
lookups seem to happen independent of the @@ version.

> 3. There can of course be only one NAME@@VERSION definition.

Right.

> 4. The version notation NAME@VERSION denotes a "hidden" version of the
>    symbol. Such versions are not directly accessible, but can be
>    accessed via asm(".symver") magic. There can be multiple "hidden"
>    versions of a symbol.

It is hidden only to the static linker, i.e. it links against either
unversioned or @@ versions of a symbol.

> 5. When resolving a reference to an unversioned symbol, NAME,
>    in an executable that was linked against a nonsymbol-versioned
>    library, the DL will, if it finds a symbol-versioned library
>    in the link map use the earliest version of the symbol provided
>    by that library.
> 
>    I presume that this behavior exists to allow easy migration
>    of a non-symbol-versioned application onto a system with
>    a symbol-versioned versioned library that uses the same major
>    version real name for the library as was formerly used by
>    a non-symbol-versioned library. (My knowledge of this area
>    was pretty much nonexistent at that time, but presumably this 
>    is what was done in the transition from glibc 2.0 to glibc 2.1.)
>    
>    To clarify the scenario I am talking about:
> 
>    a) We have prog.c which calls xyz() and is linked against a
>       non-symbol-versioned libxyz.so.2.
> 
>    b) Later, a symbol-versioned libxyz.so.2 is created that defines
>       (for example):
>           
>           xyz@@VER_3
>           xyz@VER_2
>           xyz@VER_1
> 
>       (Alternatively, we preload a shared library that defines
>       these three versions of 'xyz'.)
> 
>    c) If we run the ancient binary 'prog' which requests refers
>       to an unversioned 'xyz', that will resolve to xyz@VER_1.

That seems correct.  The VERSYM section orders the versions by index
(which seems to be based on ordering of the symbols in the version
script) and the odest in that sequence seems to win for unversioned
lookup.  For a dlsym(), the newest one wins.

> 6. [An additional detail to 5, which surprised me at first, but
>    I can sort of convince myself it makes sense...]
> 
>    In the scenario described in point 5, an unversioned
>    reference to NAME will be resolved to the earliest versioned
>    symbol NAME inside a symbol-versioned library if there is
>    is a version of NAME in the *lowest* version provided
>    by the library. Otherwise, it will resolve to the *latest*
>    version of NAME (and *not* to the default NAME@@VERSION
>    version of the symbol).
> 
>    To clarify with an example:
> 
>    We have prog.c that calls abc() and xyz(), and is linked
>    against a non-symbol-versioned library, lib_nonver.so,
>    that provides definitions of abc() and xyz().
> 
>    Then, we have a symbol-versioned library, lib_ver.so,
>    that has three versions, VER_1, VER_2, and VER_3, and defines
>    the following symbols:
> 
>        xyz@@VER_3
>        xyz@VER_2
>        xyz@VER_1
> 
>        abc@@VER_3
>        abc@VER_2
> 
>    Then we run 'prog' using:
> 
>        LD_PRELOAD=./lib_ver.so ./prog
> 
>    In this case, 'prog' will call xyz@VER_1 and abc@@VER_3
>    (*not* abc@VER_2) from lib_ver.so.
> 
>    I can convince myself (sort of) that this makes some sense by
>    thinking about things from the perspective of the scenario of
>    migrating from the non-symbol-versioned shared library to the
>    symbol-versioned shared library: the old non-symbol-versioned library
>    never provided a symbol 'abc()' so in this scenario, use the latest
>    version of 'abc'. This applies even if the the latest version is not
>    the 'default'.  In other words, even if the versions of 'abc'
>    provided by lib_ver.so were the following, it would still be the
>    VER_3 of abc() that is called:
> 
>        abc@VER_3
>        abc@@VER_2
> 
>    Am I right about my rough guess for the rationale for point 6,
>    or is there something else I should know/write about?

This seems odd, I hope someone here knows why this really is and
(hopefully) point to resources.  Documentation about the dynamic linker
are generally very hard to find, so I'm glad you're doing this.

Siddhesh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
