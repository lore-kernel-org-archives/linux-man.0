From: Christian Kamm <christian.d.kamm-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: bug in dlopen(3): use RUNPATH of loading library, not executable
Date: Thu, 13 Oct 2011 12:42:58 +0200
Message-ID: <201110131242.58292.christian.d.kamm@nokia.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I think there's a bug in the dlopen(3) page. It says that

"If the executable file for the calling program contains a  DT_RUN=E2=80=
=90
PATH tag, then the directories listed in that tag are searched."

But that's not the case, as demonstrated by this example:

---
echo -e '#include <dlfcn.h>\n#include <stdio.h>\nvoid lib1(void) { if=20
(dlopen("liblib2.so", RTLD_NOW)) printf("ok\\n"); }' > lib1.c
gcc lib1.c -shared -fPIC -o liblib1.so -ldl
cp liblib1.so liblib2.so

echo "void lib1(void); int main(void) { lib1(); }" > main.c
gcc main.c -o main $PWD/liblib1.so -Wl,-rpath,$PWD -Wl,--enable-new-dta=
gs

=2E/main # does not print 'ok'
---

If, on the other hand, you add the DT_RUNPATH tag to the library that c=
alls=20
dlopen, it gets used and liblib2.so is found.

This patch (http://sources.redhat.com/ml/libc-hacker/2002-10/msg00048.h=
tml)=20
and the answer (http://sourceware.org/ml/libc-hacker/2002-11/msg00011.h=
tml)=20
indicate that this behavior is expected by the glibc developers and not=
 a bug.

The full search seems to scan these directories, from top to bottom:

Unless loading object has RUNPATH:
  RPATH of the loading object,=20
    then the RPATH of its loader (unless it has a RUNPATH), ...,
    until the end of the chain, which is either the executable=20
    or an object loaded by dlopen
  Unless executable has RUNPATH:
    RPATH of the executable
LD_LIBRARY_PATH
RUNPATH of the loading object
ld.so.cache
default dirs

Regards,
Christian Kamm
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
