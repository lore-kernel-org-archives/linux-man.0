From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 14:40:16 +0200
Message-ID: <c6736794-60bb-517e-0bcf-2e80331f0f72@gmail.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <22f26755-f7f0-898a-ac74-3f6df92a22d7@sourceware.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F832993CC69B3B4E1A564E57"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <22f26755-f7f0-898a-ac74-3f6df92a22d7-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------F832993CC69B3B4E1A564E57
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Siddhesh,

Thanks for your response!

On 04/20/2017 08:05 AM, Siddhesh Poyarekar wrote:
> On Wednesday 19 April 2017 08:37 PM, Michael Kerrisk (man-pages) wrote:
>> 1. If looking for a versioned symbol (NAME@VERSION), the DL will search
>>    starting from the start of the link map ("namespace") until it finds the
>>    first instance of either a matching unversioned NAME or an exact version
>>    match on NAME@VERSION. Preloading takes advantage of the former case to
>>    allow easy overriding of versioned symbols in a library that is loaded 
>>    later in the link map.
> 
> I believe it is the other way around, i.e. it looks for the versioned
> symbol first and if it is not found, link against the unversioned symbol
> provided that it is public.

I think that I have failed to provide enough detail for
you to understand what I meant. Consider the following:

1. We want to interpose some symbol in glibc (say, "malloc@GLIBC_2.0")
   with a symbol of our own (perhaps via a preloaded library).
2. In our preloaded shared library, the interposing "malloc"
   need not be a versioned symbol.

At least

>> 2. The version notation NAME@@VERSION denotes the default version
>>    for NAME. This default version is used in the following places:
>>
>>    a) At static link time, this is the version that the static
>>       linker will bind to when creating the relocation record
>>       that will be used by the DL.
>>    b) When doing a dlsym() look-up on the unversioned symbol NAME.
>>       (See check_match() in elf/dl-lookup.c)
>>
>>    Is the default version used in any other circumstance?
> 
> Only (a) afaict, where do you see (2) happening?  Unversioned symbol
> lookups seem to happen independent of the @@ version.

See the following (tarball of code attached):

$ cat sv_lib_v3.c
/*#* sv_lib_v3.c

   COPYRIGHT-NOTICE
*/

#include <stdio.h>

#ifndef DEF_XYZ_V2
__asm__(".symver xyz_newest,xyz@@VER_3");
__asm__(".symver xyz_new,xyz@VER_2");
#else
__asm__(".symver xyz_newest,xyz@VER_3");
__asm__(".symver xyz_new,xyz@@VER_2");
#endif
__asm__(".symver xyz_old,xyz@VER_1");

__asm__(".symver pqr_new,pqr@@VER_3");
__asm__(".symver pqr_old,pqr@VER_2");

__asm__(".symver tuv_newest,tuv@@VER_3");
__asm__(".symver tuv_new,tuv@VER_2");
__asm__(".symver tuv_old,tuv@VER_1");

void xyz_old(void) { printf("v1 xyz\n"); }

void xyz_new(void) { printf("v2 xyz\n"); }

void xyz_newest(void) { printf("v3 xyz\n"); }

void tuv_old(void) { printf("v1 tuv\n"); }

void tuv_new(void) { printf("v2 tuv\n"); }

void tuv_newest(void) { printf("v3 tuv\n"); }

void pqr_new(void) { printf("v3 pqr\n"); }

void pqr_old(void) { printf("v2 pqr\n"); }

void abc(void) { printf("v3 abc\n"); }
void v123(void) { printf("v3 v123\n"); }

$ cat sv_v3.map
VER_1 {
	global: xyz; tuv;
local: 	[a-uw-z]*; 	# Hide all other symbols
}; 

VER_2 { 
     	global: pqr;
} VER_1;

VER_3 {
    	global: abc;
} VER_2;

$ # Build version 3 of shared library, where the default (@@) version
$ # of xyz is VER_3
$ gcc -g -c -fPIC -Wall sv_lib_v3.c
$ gcc -g -shared -o libsv.so sv_lib_v3.o -Wl,--version-script,sv_v3.map

$ # Build version 3 of shared library, where the default (@@) version
$ # of xyz is VER_2
$ gcc -DDEF_XYZ_V2 -g -c -fPIC -Wall sv_lib_v3.c
$ gcc -g -shared -o libsv_def_xyz_v2.so sv_lib_v3.o -Wl,--version-script,sv_v3.map

$ # Verify symbol versions in the two DSOs:
$
$ readelf --dyn-syms libsv.so | grep xyz
    20: 0000000000000930    19 FUNC    GLOBAL DEFAULT   12 xyz@VER_1
    21: 0000000000000956    19 FUNC    GLOBAL DEFAULT   12 xyz@@VER_3
    22: 0000000000000943    19 FUNC    GLOBAL DEFAULT   12 xyz@VER_2
$ readelf --dyn-syms libsv_def_xyz_v2.so | grep xyz
    20: 0000000000000943    19 FUNC    GLOBAL DEFAULT   12 xyz@@VER_2
    21: 0000000000000956    19 FUNC    GLOBAL DEFAULT   12 xyz@VER_3
    22: 0000000000000930    19 FUNC    GLOBAL DEFAULT   12 xyz@VER_1

$ cat dynload.c 
#include <dlfcn.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

int
main(int argc, char *argv[])
{
    void *libHandle;            /* Handle for shared library */
    void (*funcp)(void);        /* Pointer to function with no arguments */
    const char *err;

    if (argc != 3 || strcmp(argv[1], "--help") == 0) {
        fprintf(stderr, "Usage: %s lib-path func-name\n", argv[0]);
	exit(EXIT_FAILURE);
    }

    /* Load the shared library and get a handle for later use */

    libHandle = dlopen(argv[1], RTLD_LAZY);
    if (libHandle == NULL) {
        fprintf(stderr, "dlopen: %s\n", dlerror());
	exit(EXIT_FAILURE);
    }

    /* Search library for symbol named in argv[2] */

    (void) dlerror();                           /* Clear dlerror() */
    *(void **) (&funcp) = dlsym(libHandle, argv[2]);
    err = dlerror();
    if (err != NULL) {
        fprintf(stderr, "dlsym: %s\n", err);
	exit(EXIT_FAILURE);
    }

    /* Try calling the address returned by dlsym() as a function
       that takes no arguments */

    (*funcp)();

    dlclose(libHandle);                         /* Close the library */

    exit(EXIT_SUCCESS);
}

$ gcc -o dynload dynload.c -ldl
$ ./dynload ./libsv.so xyz
v3 xyz
$ ./dynload ./libsv_def_xyz_v2.so xyz
v2 xyz

Note the last line: dlsym() found xyz@@VER_2 (not xyz@VER_3).

>> 3. There can of course be only one NAME@@VERSION definition.
> 
> Right.
> 
>> 4. The version notation NAME@VERSION denotes a "hidden" version of the
>>    symbol. Such versions are not directly accessible, but can be
>>    accessed via asm(".symver") magic. There can be multiple "hidden"
>>    versions of a symbol.
> 
> It is hidden only to the static linker, i.e. it links against either
> unversioned or @@ versions of a symbol.

Yes.

>> 5. When resolving a reference to an unversioned symbol, NAME,
>>    in an executable that was linked against a nonsymbol-versioned
>>    library, the DL will, if it finds a symbol-versioned library
>>    in the link map use the earliest version of the symbol provided
>>    by that library.
>>
>>    I presume that this behavior exists to allow easy migration
>>    of a non-symbol-versioned application onto a system with
>>    a symbol-versioned versioned library that uses the same major
>>    version real name for the library as was formerly used by
>>    a non-symbol-versioned library. (My knowledge of this area
>>    was pretty much nonexistent at that time, but presumably this 
>>    is what was done in the transition from glibc 2.0 to glibc 2.1.)
>>    
>>    To clarify the scenario I am talking about:
>>
>>    a) We have prog.c which calls xyz() and is linked against a
>>       non-symbol-versioned libxyz.so.2.
>>
>>    b) Later, a symbol-versioned libxyz.so.2 is created that defines
>>       (for example):
>>           
>>           xyz@@VER_3
>>           xyz@VER_2
>>           xyz@VER_1
>>
>>       (Alternatively, we preload a shared library that defines
>>       these three versions of 'xyz'.)
>>
>>    c) If we run the ancient binary 'prog' which requests refers
>>       to an unversioned 'xyz', that will resolve to xyz@VER_1.
> 
> That seems correct.  The VERSYM section orders the versions by index
> (which seems to be based on ordering of the symbols in the version
> script) and the odest in that sequence seems to win for unversioned
> lookup.  For a dlsym(), the newest one wins.

Thanks for the confirmation.

>> 6. [An additional detail to 5, which surprised me at first, but
>>    I can sort of convince myself it makes sense...]
>>
>>    In the scenario described in point 5, an unversioned
>>    reference to NAME will be resolved to the earliest versioned
>>    symbol NAME inside a symbol-versioned library if there is
>>    is a version of NAME in the *lowest* version provided
>>    by the library. Otherwise, it will resolve to the *latest*
>>    version of NAME (and *not* to the default NAME@@VERSION
>>    version of the symbol).
>>
>>    To clarify with an example:
>>
>>    We have prog.c that calls abc() and xyz(), and is linked
>>    against a non-symbol-versioned library, lib_nonver.so,
>>    that provides definitions of abc() and xyz().
>>
>>    Then, we have a symbol-versioned library, lib_ver.so,
>>    that has three versions, VER_1, VER_2, and VER_3, and defines
>>    the following symbols:
>>
>>        xyz@@VER_3
>>        xyz@VER_2
>>        xyz@VER_1
>>
>>        abc@@VER_3
>>        abc@VER_2
>>
>>    Then we run 'prog' using:
>>
>>        LD_PRELOAD=./lib_ver.so ./prog
>>
>>    In this case, 'prog' will call xyz@VER_1 and abc@@VER_3
>>    (*not* abc@VER_2) from lib_ver.so.
>>
>>    I can convince myself (sort of) that this makes some sense by
>>    thinking about things from the perspective of the scenario of
>>    migrating from the non-symbol-versioned shared library to the
>>    symbol-versioned shared library: the old non-symbol-versioned library
>>    never provided a symbol 'abc()' so in this scenario, use the latest
>>    version of 'abc'. This applies even if the the latest version is not
>>    the 'default'.  In other words, even if the versions of 'abc'
>>    provided by lib_ver.so were the following, it would still be the
>>    VER_3 of abc() that is called:
>>
>>        abc@VER_3
>>        abc@@VER_2
>>
>>    Am I right about my rough guess for the rationale for point 6,
>>    or is there something else I should know/write about?
> 
> This seems odd, I hope someone here knows why this really is and
> (hopefully) point to resources. 

Florian commented on this point already. See his mail.

> Documentation about the dynamic linker
> are generally very hard to find, 

It sure is...

> so I'm glad you're doing this.

Let's see if I can make something useful...

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--------------F832993CC69B3B4E1A564E57
Content-Type: application/gzip;
 name="symver_default.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="symver_default.tar.gz"

H4sIAL2r+FgAA+1Xa2/aSBTN1/hX3BLtyiBIsB2IVJZVK0o3kVBbJaRq2o2swR7A6jBmPYaU
pvz33hk/IDGQSI1aVTvnC+bO8X0cz52HWEzmNHJ9OiQzFh+JuTt3DidkuveEqCOax8fy1zpp
1Nd/FWy7uWc59ZPGidM4sZBnHdcdew/qT5nENsxETCKAvUn8eSfvofHfFO+7564Ft8b+iIUD
wp7Dl8XXFsSzectgoScN+59IbXZT+3pdacH+AZwGPgXCGITxmEYgFpNByISxbIFhSGc23IIB
ErnL6X9Ry1iCCtVKWA6GvMMhAy/j2C3jV6vy/4G42//+grOQ+IfeU8Z4oP9tp26r/m9adsNu
nKj+b+r+/yk4CLjHZtjSf/ls6PHD8d/GyiQW4iheTKm4Z479ICyYWDC4a5vxAM33eVHAR3dt
NIq4cmcEPDYmJOAmPgCJRl4VvDF+nQo+zz9dl41k0ZiHgQ8VjHdKuM9oC9ZwVIHECsMQVyd8
m/qA1IhEC6gcrd43K8MZ96ZlU/4rt9befxdieFza4hAkJQ5CDjdBPAYeyqRmE8pjkfnyQi7i
NEssBJc3aQ2GYMr84VkbHPj2DbBubzI1VR3WdRVKtdqYsmmpDO021MvpaigxnKJC8dBE6dAf
Mi8FGdHn8IeQZdSmBBORadU4mdB/eakKymn9utwy9umXIDa7H8767uuXZ73L8y4apdNlkhYW
18PuBly570uDmsGIouowXsnHiNRhJqisVnnIRYc2+CycUr6q6bzfe+X2Xn68SoNKEdb4bXhz
2evtLDXxKGtVheFrURRGZvlxpV1QEnnjvCL1/dXuBFIqHwKeSGVf5+UkH38V6M5UugeM0GEY
YsXO5kDFTGZkpQzmn8msUvJg9JUA1Sx4mjf6UKQsci6ZHHj2KLHQf64V2h6nUh+lwX2dYRuq
eUB8P6JCQETjWcRRpsEiTb0MROB8yHogyyQekxhi8pmKQkMkmmaNVU6bwWceCwVdSbFDZiUy
klVqa22bSJYXd3HZ6XQvLjDCUp8VfgiicP5H1eUd4AlPAA/s/1bzuJ6f/xtOXe7/jq33/5+C
o8pBBda+uuq0ztt3V+dn/5z2a2/e9s86XUN24Ib9H21DjlMHXnVfux+uPrrvbcN1iZi4rlk6
TKaWvFC4nN5QEVfx8cULdfwvYetuYyqaughI1gFlgj7o9XFO171yPxhuZofMz31aklyk4Y1G
OcXfXQVJmvQmaXnoIg1vW1kt+LjLYcpUtNzhRpYMm7GSItQeldaX7nu3kG4qpbklh3AnwbV5
ucbFYEWuvZWLJRTpTpGeZrgpDRwqcreksY27JY0CPf2Mm7g4VORuTNkucvEyu8knmjOeos0t
29nEk/aM+KvXBw0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0Njd8T3wFim8V3ACgAAA==
--------------F832993CC69B3B4E1A564E57--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
