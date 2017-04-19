From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Documenting the (dynamic) linking rules for symbol versioning
Date: Wed, 19 Apr 2017 17:07:44 +0200
Message-ID: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-78750-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Cc: mtk.manpages@gmail.com, linux-man <linux-man@vger.kernel.org>, Siddhesh Poyarekar <siddhesh@sourceware.org>, Carlos O'Donell <carlos@redhat.com>, Rich Felker <dalias@aerifal.cx>, "H.J. Lu" <hjl.tools@gmail.com>
List-Id: linux-man@vger.kernel.org

Hello libc folk,

The documentation around symbol versioning as used by the glibc dynamic
linker (DL) is currently rather weak, and I'd like to add some pieces to
various man pages (ld.so(8), dlsym(3), and possibly others) to improve
this situation. Before that though, I'd rather like to check my
understanding of the rules.

The following are the rules as I understand them. Please let
me know of corrections and additions:

1. If looking for a versioned symbol (NAME@VERSION), the DL will search
   starting from the start of the link map ("namespace") until it finds the
   first instance of either a matching unversioned NAME or an exact version
   match on NAME@VERSION. Preloading takes advantage of the former case to
   allow easy overriding of versioned symbols in a library that is loaded 
   later in the link map.

2. The version notation NAME@@VERSION denotes the default version
   for NAME. This default version is used in the following places:

   a) At static link time, this is the version that the static
      linker will bind to when creating the relocation record
      that will be used by the DL.
   b) When doing a dlsym() look-up on the unversioned symbol NAME.
      (See check_match() in elf/dl-lookup.c)

   Is the default version used in any other circumstance?

3. There can of course be only one NAME@@VERSION definition.

4. The version notation NAME@VERSION denotes a "hidden" version of the
   symbol. Such versions are not directly accessible, but can be
   accessed via asm(".symver") magic. There can be multiple "hidden"
   versions of a symbol.

5. When resolving a reference to an unversioned symbol, NAME,
   in an executable that was linked against a nonsymbol-versioned
   library, the DL will, if it finds a symbol-versioned library
   in the link map use the earliest version of the symbol provided
   by that library.

   I presume that this behavior exists to allow easy migration
   of a non-symbol-versioned application onto a system with
   a symbol-versioned versioned library that uses the same major
   version real name for the library as was formerly used by
   a non-symbol-versioned library. (My knowledge of this area
   was pretty much nonexistent at that time, but presumably this 
   is what was done in the transition from glibc 2.0 to glibc 2.1.)
   
   To clarify the scenario I am talking about:

   a) We have prog.c which calls xyz() and is linked against a
      non-symbol-versioned libxyz.so.2.

   b) Later, a symbol-versioned libxyz.so.2 is created that defines
      (for example):
          
          xyz@@VER_3
          xyz@VER_2
          xyz@VER_1

      (Alternatively, we preload a shared library that defines
      these three versions of 'xyz'.)

   c) If we run the ancient binary 'prog' which requests refers
      to an unversioned 'xyz', that will resolve to xyz@VER_1.

6. [An additional detail to 5, which surprised me at first, but
   I can sort of convince myself it makes sense...]

   In the scenario described in point 5, an unversioned
   reference to NAME will be resolved to the earliest versioned
   symbol NAME inside a symbol-versioned library if there is
   is a version of NAME in the *lowest* version provided
   by the library. Otherwise, it will resolve to the *latest*
   version of NAME (and *not* to the default NAME@@VERSION
   version of the symbol).

   To clarify with an example:

   We have prog.c that calls abc() and xyz(), and is linked
   against a non-symbol-versioned library, lib_nonver.so,
   that provides definitions of abc() and xyz().

   Then, we have a symbol-versioned library, lib_ver.so,
   that has three versions, VER_1, VER_2, and VER_3, and defines
   the following symbols:

       xyz@@VER_3
       xyz@VER_2
       xyz@VER_1

       abc@@VER_3
       abc@VER_2

   Then we run 'prog' using:

       LD_PRELOAD=./lib_ver.so ./prog

   In this case, 'prog' will call xyz@VER_1 and abc@@VER_3
   (*not* abc@VER_2) from lib_ver.so.

   I can convince myself (sort of) that this makes some sense by
   thinking about things from the perspective of the scenario of
   migrating from the non-symbol-versioned shared library to the
   symbol-versioned shared library: the old non-symbol-versioned library
   never provided a symbol 'abc()' so in this scenario, use the latest
   version of 'abc'. This applies even if the the latest version is not
   the 'default'.  In other words, even if the versions of 'abc'
   provided by lib_ver.so were the following, it would still be the
   VER_3 of abc() that is called:

       abc@VER_3
       abc@@VER_2

   Am I right about my rough guess for the rationale for point 6,
   or is there something else I should know/write about?

7. The way to remove a versioned symbol from a new release
   of a shared library is to not define a default version
   (NAME@@VERSION) for that symbol. (Right?) 

   In other words, if we wanted to create a VER_4 of lib_ver.so
   that removed the symbol 'abc', we simply don't create use
   the usual asm(".symver") magic to create abc@VER_4.
   
And of course if there are other symbol versioning details
that should be documented, please let me know.

Cheers,

Michael
   
   
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
