From: =?UTF-8?B?TGFzc2UgS8Okcmtrw6RpbmVu?= <tronic-ze05kZMmeybHOG6cAo2yLw@public.gmane.org>
Subject: Error in man page: realloc(ptr, 0) is not equivalent to free(ptr)
Date: Thu, 21 Feb 2008 08:26:55 +0200
Message-ID: <47BD19AF.4000101@trn.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The man page says that realloc(ptr, 0) is equivalent to free, even
though it isn't. The text on the man page says

---
realloc()  changes the size of the memory block pointed to by ptr to
size bytes.  The contents will be unchanged to the minimum of the old
and new sizes;  newly  allocated memory  will  be  uninitialized.   If
ptr  is  NULL,  the call is equivalent to malloc(size); if size is equa=
l
to zero, the call is equivalent to free(ptr).  Unless ptr is NULL, it
must have been returned by an earlier call to malloc(), calloc() or
realloc().  If the area pointed to was moved, a free(ptr) is done.
[...]
realloc()  returns a pointer to the newly allocated memory, which is
suitably aligned for any kind of variable and may be different from ptr=
,
or NULL if the request fails.  If  size  was equal to 0, either NULL or
a pointer suitable to be passed to free() is returned.  If realloc()
fails the original block is left untouched; it is not freed or moved.
---

The C99 standard says:

---
7.20.3.4 The realloc function
Synopsis
        #include <stdlib.h>
        void *realloc(void *ptr, size_t size);
Description

The realloc function deallocates the old object pointed to by ptr and
returns a pointer to a new object that has the size speci=EF=AC=81ed by=
 size.
The contents of the new object shall be the same as that of the old
object prior to deallocation, up to the lesser of the new and old sizes=
=2E
Any bytes in the new object beyond the size of the old object have
indeterminate values.

If ptr is a null pointer, the realloc function behaves like the malloc
function for the speci=EF=AC=81ed size. Otherwise, if ptr does not matc=
h a
pointer earlier returned by the calloc, malloc, or realloc function, or
if the space has been deallocated by a call to the free or realloc
function, the behavior is unde=EF=AC=81ned. If memory for the new objec=
t cannot
be allocated, the old object is not deallocated and its value is unchan=
ged.

Returns

The realloc function returns a pointer to the new object (which may hav=
e
the same value as a pointer to the old object), or a null pointer if th=
e
new object could not be allocated.
---


glibc implements the behavior specified by the standard, not that
specified on the man page. realloc(NULL, 0) is equivalent to malloc(24)=
,
actually allocating the minimum block (which is 24 bytes at least on my
architecture) instead of doing nothing like free(NULL) does.

One test case to demonstrate this:

#include <stdlib.h>

int main(void) {
    void* ptr =3D malloc(100);
    // Man page says this is equivalent to free(ptr)
    ptr =3D realloc(ptr, 0);
    // ... but according to Valgrind, this program leaks memory,
    // unless you add
    free(ptr);
    // ... which should be invalid (double free)
}

Another one (as requested by jeffz on #gnu):

#include <stdlib.h>

int main(void) {
    for (size_t i =3D 0; i < 0x7FFFFFFF; ++i) {
        void* ptr =3D realloc(NULL, 0);
    }
}

According to the man page, this program should not allocate any memory,
but it ends up allocating several gigabytes until OOM killer takes care
of it.
