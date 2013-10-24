From: Greg Price <price-DPNOqEs/LNQ@public.gmane.org>
Subject: [PATCH] malloc.3: Scale back promises of alignment
Date: Thu, 24 Oct 2013 15:42:48 -0400
Message-ID: <20131024194248.GC16996@ringworld.MIT.EDU>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

It's not true that the return value is suitably aligned for "any
variable"; for example, it's unsuitable for a variable like
  float *x __attribute__ ((__vector_size__ (32)));
which requires 32-byte alignment.  Types like this are defined in
<avxintrin.h>, and with 16-byte alignment in <emmintrin.h> and
<xmmintrin.h>, so the application programmer need not even know
that a vector_size attribute has been applied.

On an x86 architecture, a program that loads from or stores to a
pointer with this type derived from malloc can crash because GCC
generates an aligned load/store, like MOVDQA.

The C99 standard (TC3, as of N1256) does say the return value is
suitably aligned for "any type of object".  The C11 standard (as
of N1570) revises this to any type with "fundamental alignment",
which means an alignment "supported by the implementation in all
contexts", which I suppose tautologically includes aligning
malloc/realloc return values.

The actual behavior of current glibc malloc is to align to the
greater of 2 * sizeof(size_t) and __alignof__ (long double),
which may be one bit greater than this commit promises.

Signed-off-by: Greg Price <price-3s7WtUTddSA@public.gmane.org>
---
 man3/malloc.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/malloc.3 b/man3/malloc.3
index 372b503..84d9852 100644
--- a/man3/malloc.3
+++ b/man3/malloc.3
@@ -131,8 +131,8 @@ The
 .BR malloc ()
 and
 .BR calloc ()
-functions return a pointer to the allocated memory
-that is suitably aligned for any kind of variable.
+functions return a pointer to the allocated memory,
+which is suitably aligned for any built-in type.
 On error, these functions return NULL.
 NULL may also be returned by a successful call to
 .BR malloc ()
@@ -154,7 +154,7 @@ function returns no value.
 The
 .BR realloc ()
 function returns a pointer to the newly allocated memory, which is suitably
-aligned for any kind of variable and may be different from
+aligned for any built-in type and may be different from
 .IR ptr ,
 or NULL if the request fails.
 If
-- 
1.8.3.2
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
