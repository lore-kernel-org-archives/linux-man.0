Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED78548986D
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 21:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532745; cv=none; b=PzbNLl4zfwZPK0cOhGLxQxr72vcj8zBWvTxXjsGhVH0FdyImAdfY4AzltgbtINs3XgI0WwXd32KjHj9SSXybcwsiNp2wx9RFxgD5iYQGLp9ZrAacKgSNTD8uhN4fSvVt3UfIx35+WXsxPhP0c5kbp9u/2E04uPgTtnix+j0SlKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532745; c=relaxed/simple;
	bh=ASEhfMckrxOwabidRbtXXk9erM0UOOlLn1EVJroYgJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lg0tqYFJLfi8fK+WCmSjKaBxJPU7CqAjIFtIB7CRULFWiBderrEoKk04OnAEuKZaEfN6QD6cMKewk5vWYSfPfEg3TFyjK0WIw5aysg7XZV/D2JzYBV36TgkopaEXmY+PXt/6ywhk4wtbegh5DWrdsORxnJEvoecVMwOMyAuxqUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hb04MjI4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hb04MjI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BE31F00AC4;
	Fri, 31 Jul 2026 21:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785532743;
	bh=vOoVAyd+xRtWxINhdM23tgXOhIZYrDTTtSVx3M2U9SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hb04MjI43TEauoe3RSEmtjV9x4dax7Q+BYnBGArnc5SySyk/bPXbty3XWIBclE55d
	 pqGGXXex41ppwJsCFH9qUyu/L8u53G0QwuIHwi+ag/dWc8v1TjyiGxLVJsTW7T6/8d
	 iRLUOVl2sxfxZrd9uARluqWR2dPp4jtXW94ntO9FSeHto/KA8OLLU2fnBV06a8LcNL
	 kFADM4EOC+MjhKEYxYhIF0ld6Dfm65RivsWxHhIIHcHklUBGKExWwjlr9L/KARcdGN
	 0zEN4fsVAk3n98yNvrq6OqU6Sem8ePNk7QZiltR7S6s08gOXyt0R9p+no70OQ2kh6Z
	 dNpjX9wKA3OEw==
Date: Fri, 31 Jul 2026 23:18:59 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Keith Bostic <keith@bostic.com>, Joseph Myers <josmyers@redhat.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>
Subject: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document
 these as provided by <memory.h>
Message-ID: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <cover.1785532392.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ocdeakgdfku6i7wy"
Content-Disposition: inline
In-Reply-To: <cover.1785532392.git.alx@kernel.org>


--ocdeakgdfku6i7wy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Keith Bostic <keith@bostic.com>, Joseph Myers <josmyers@redhat.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>
Subject: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document
 these as provided by <memory.h>
Message-ID: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
References: <cover.1785532392.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1785532392.git.alx@kernel.org>

The standard mixes functions for handling strings, functions for
handling bytes, and other hybrids, all in a single header file:
<string.h>.

This has historically caused confusion, for example leading to believe
that strncpy(3) is appropriate to handle strings.

It turns out that mem*() functions haven't been always in <string.h>.
These functions were first introduced in 1983 in System V, and were
added in a separate <memory.h> file.  Very soon, they were added to
4.3BSD in 1986 for compatibility to System V, also in <memory.h>.

Most modern-day POSIX-compatible libc implementations still provide this
header file for backwards compatibility reasons:

	$ find ~/src/bsd/freebsd/main/ | grep /include/memory.h
	/home/alx/src/bsd/freebsd/main/include/memory.h
	$ find ~/src/bsd/netbsd/trunk/ | grep /include/memory.h
	/home/alx/src/bsd/netbsd/trunk/include/memory.h
	$ find ~/src/bsd/openbsd/master/ | grep /include/memory.h
	/home/alx/src/bsd/openbsd/master/include/memory.h
	$ find ~/src/gnu/glibc/master/ | grep /include/memory.h
	/home/alx/src/gnu/glibc/master/include/memory.h
	$ find ~/src/musl/libc/master/ | grep /include/memory.h
	/home/alx/src/musl/libc/master/include/memory.h

It seems that it was C89 that moved the mem*() functions to <string.h>,
even though the Rationale document for C89 doesn't mention it at all.

This was a huge mistake --we can see the consequences in the many
misuses of these functions, and programmers that believe they are
appropriate for uses for which they are unappropriate-- that we can undo
now.

Let's document these as provided by <memory.h>, which is still true;
all POSIX-ish libc implementations I've consulted provide the <memory.h>
header with mem*() functions, except two: Illumos gate, and gnulib.
Let's ignore them, or rather, hope they will follow suit eventually.

This will signal to programmers that this is the header file they should
be using.  The C Committee is discussing the possibility of
standardizing the good old <memory.h> header file, so let's give it a
little bump.

Let's also move the strn*() functions there, since modern libc
implementations also provide them there.  And they certainly don't
belong in <string.h>, so <memory.h> is more adequate.

After this change, <string.h> contains only functions that exclusively
handle (and require) strings.

Cc: Keith Bostic <keith@bostic.com>
Cc: Joseph Myers <josmyers@redhat.com>
Cc: Mark Harris <mark.hsj@gmail.com>
Cc: Nevin Liber <nevin@cplusplusguy.com>
Cc: JeanHeyd Meneide <phdofthehouse@gmail.com>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Iker Pedrosa <ipedrosa@redhat.com>
Cc: "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>
Cc: Kees Cook <keescook@chromium.org>
Cc: bug-gnulib@gnu.org
Cc: libc-alpha@sourceware.org
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man3/memccpy.3    | 5 ++++-
 man/man3/memchr.3     | 5 ++++-
 man/man3/memcmp.3     | 5 ++++-
 man/man3/memcpy.3     | 5 ++++-
 man/man3/memfrob.3    | 2 +-
 man/man3/memmem.3     | 2 +-
 man/man3/memmove.3    | 5 ++++-
 man/man3/mempcpy.3    | 2 +-
 man/man3/memrchr.3    | 2 +-
 man/man3/memset.3     | 5 ++++-
 man/man3/stpncpy.3    | 8 +++++++-
 man/man3/strcasecmp.3 | 6 ++++++
 man/man3/strcmp.3     | 6 ++++++
 man/man3/strdup.3     | 5 +++++
 man/man3/strdupa.3    | 4 ++++
 man/man3/strncat.3    | 5 ++++-
 man/man3/strnlen.3    | 5 ++++-
 17 files changed, 64 insertions(+), 13 deletions(-)

diff --git a/man/man3/memccpy.3 b/man/man3/memccpy.3
index 706f8152f58c..a6bc4e8a3e0b 100644
--- a/man/man3/memccpy.3
+++ b/man/man3/memccpy.3
@@ -12,7 +12,7 @@ .SH LIBRARY
 .RI ( libc ,\~ \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <string.h>
+.BR #include\~<memory.h> "  // See STANDARDS"
 .P
 .BR "void *memccpy(" "size_t n;"
 .BI "              void " dest "[restrict " n "], const void " src "[restr=
ict " n ],
@@ -67,6 +67,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 POSIX.1-2008.
+.P
+ISO C and POSIX declare this function in
+.IR <string.h> .
 .SH HISTORY
 POSIX.1-2001, SVr4, 4.3BSD.
 .SH SEE ALSO
diff --git a/man/man3/memchr.3 b/man/man3/memchr.3
index 0a493ff4029d..f3ee95c00406 100644
--- a/man/man3/memchr.3
+++ b/man/man3/memchr.3
@@ -12,7 +12,7 @@ .SH LIBRARY
 .RI ( libc ,\~ \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <string.h>
+.BR #include\~<memory.h> "  // See STANDARDS"
 .P
 .BR "void *memchr(" "size_t n;"
 .BI "             const void " s [ n "], int " c ", size_t " n );
@@ -53,6 +53,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 C11, POSIX.1-2008.
+.P
+ISO C and POSIX declare this function in
+.IR <string.h> .
 .SH HISTORY
 POSIX.1-2001, C89, SVr4, 4.3BSD.
 .SH SEE ALSO
diff --git a/man/man3/memcmp.3 b/man/man3/memcmp.3
index 9cecb282ba4f..467f24cb39a7 100644
--- a/man/man3/memcmp.3
+++ b/man/man3/memcmp.3
@@ -12,7 +12,7 @@ .SH LIBRARY
 .RI ( libc ,\~ \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <string.h>
+.BR #include\~<memory.h> "  // See STANDARDS"
 .P
 .BR "int memcmp(" "size_t n;"
 .BI "           const void " s1 [ n "], const void " s2 [ n "], size_t " n=
 );
@@ -70,6 +70,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 C11, POSIX.1-2008.
+.P
+ISO C and POSIX declare this function in
+.IR <string.h> .
 .SH HISTORY
 POSIX.1-2001, C89, SVr4, 4.3BSD.
 .SH CAVEATS
diff --git a/man/man3/memcpy.3 b/man/man3/memcpy.3
index f8f049bf5c4c..7083dc3f7577 100644
--- a/man/man3/memcpy.3
+++ b/man/man3/memcpy.3
@@ -13,7 +13,7 @@ .SH LIBRARY
 .RI ( libc ,\~ \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <string.h>
+.BR #include\~<memory.h> "  // See STANDARDS"
 .P
 .BR "void *memcpy(" "size_t n;"
 .BI "             void " dest "[restrict " n "], const void " src "[restri=
ct " n ],
@@ -53,6 +53,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 C11, POSIX.1-2008.
+.P
+ISO C and POSIX declare this function in
+.IR <string.h> .
 .SH HISTORY
 POSIX.1-2001, C89, SVr4, 4.3BSD.
 .SH CAVEATS
diff --git a/man/man3/memfrob.3 b/man/man3/memfrob.3
index ee41da0ced7b..ad736949002c 100644
--- a/man/man3/memfrob.3
+++ b/man/man3/memfrob.3
@@ -13,7 +13,7 @@ .SH LIBRARY
 .SH SYNOPSIS
 .nf
 .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
-.B #include <string.h>
+.B #include <memory.h>
 .P
 .BR "void *memfrob(" "size_t n;"
 .BI "              void " s [ n "], size_t " n );
diff --git a/man/man3/memmem.3 b/man/man3/memmem.3
index 13fd8b7cea7b..d0f99e6d577d 100644
--- a/man/man3/memmem.3
+++ b/man/man3/memmem.3
@@ -13,7 +13,7 @@ .SH LIBRARY
 .SH SYNOPSIS
 .nf
 .BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
-.B #include <string.h>
+.B #include <memory.h>
 .P
 .BR "void *memmem(" "size_t hsize, size_t nsize;"
 .BI "             const void " haystack [ hsize "], size_t " hsize ,
diff --git a/man/man3/memmove.3 b/man/man3/memmove.3
index 99f152412142..65f6a67b9b35 100644
--- a/man/man3/memmove.3
+++ b/man/man3/memmove.3
@@ -12,7 +12,7 @@ .SH LIBRARY
 .RI ( libc ,\~ \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <string.h>
+.BR #include\~<memory.h> "  // See STANDARDS"
 .P
 .BR "void *memmove(" "size_t n;"
 .BI "              void " dest [ n "], const void " src [ n "], size_t " n=
 );
@@ -56,6 +56,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 C11, POSIX.1-2008.
+.P
+ISO C and POSIX declare this function in
+.IR <string.h> .
 .SH HISTORY
 POSIX.1-2001, C89, SVr4, 4.3BSD.
 .SH SEE ALSO
diff --git a/man/man3/mempcpy.3 b/man/man3/mempcpy.3
index 012e6326dd00..4598be5d7bc2 100644
--- a/man/man3/mempcpy.3
+++ b/man/man3/mempcpy.3
@@ -14,7 +14,7 @@ .SH LIBRARY
 .SH SYNOPSIS
 .nf
 .BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
-.B #include <string.h>
+.B #include <memory.h>
 .P
 .BR "void *mempcpy(" "size_t n;"
 .BI "              void " dest "[restrict " n "], const void " src "[restr=
ict " n ],
diff --git a/man/man3/memrchr.3 b/man/man3/memrchr.3
index 6e49defc5e4a..fe2841147f05 100644
--- a/man/man3/memrchr.3
+++ b/man/man3/memrchr.3
@@ -13,7 +13,7 @@ .SH LIBRARY
 .SH SYNOPSIS
 .nf
 .BR #define\~_GNU_SOURCE "  // See feature_test_macros(7)"
-.B #include <string.h>
+.B #include <memory.h>
 .P
 .BR void\~*memrchr( size_t\~n;
 .BI "              const void " s [ n "], int " c ", size_t " n );
diff --git a/man/man3/memset.3 b/man/man3/memset.3
index 91b3b476abf9..b69398a7762a 100644
--- a/man/man3/memset.3
+++ b/man/man3/memset.3
@@ -12,7 +12,7 @@ .SH LIBRARY
 .RI ( libc ,\~ \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <string.h>
+.BR #include\~<memory.h> "  // See STANDARDS"
 .P
 .BR "void *memset(" "size_t n;"
 .BI "             void " s [ n "], int " c ", size_t " n );
@@ -48,6 +48,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 C11, POSIX.1-2008.
+.P
+ISO C and POSIX declare this function in
+.IR <string.h> .
 .SH HISTORY
 POSIX.1-2001, C89, SVr4, 4.3BSD.
 .SH SEE ALSO
diff --git a/man/man3/stpncpy.3 b/man/man3/stpncpy.3
index 5b1ec5595169..4d959fde9f83 100644
--- a/man/man3/stpncpy.3
+++ b/man/man3/stpncpy.3
@@ -14,7 +14,7 @@ .SH LIBRARY
 .RI ( libc ,\~ \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <string.h>
+.BR #include\~<memory.h> "  // See STANDARDS"
 .P
 .BR "char *strncpy(" "size_t dsize;"
 .BI "              char " dst "[restrict " dsize "], const char *restrict =
" src ,
@@ -97,9 +97,15 @@ .SH STANDARDS
 .TP
 .BR strncpy ()
 C11, POSIX.1-2008.
+.IP
+ISO C and POSIX declare this function in
+.IR <string.h> .
 .TP
 .BR stpncpy ()
 POSIX.1-2008.
+.IP
+POSIX declares this function in
+.IR <string.h> .
 .SH HISTORY
 .TP
 .BR strncpy ()
diff --git a/man/man3/strcasecmp.3 b/man/man3/strcasecmp.3
index 65941ddf6524..a4100a0d0f02 100644
--- a/man/man3/strcasecmp.3
+++ b/man/man3/strcasecmp.3
@@ -15,6 +15,9 @@ .SH SYNOPSIS
 .B #include <strings.h>
 .P
 .BI "int strcasecmp(const char *" s1 ", const char *" s2 );
+.P
+.BR #include\~<memory.h> "  // See STANDARDS"
+.P
 .BI "int strncasecmp(const char " s1 "[], const char " s2 "[], size_t " n =
);
 .fi
 .SH DESCRIPTION
@@ -70,6 +73,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 POSIX.1-2008.
+.P
+POSIX declares both functions in
+.IR <string.h> .
 .SH HISTORY
 4.4BSD, POSIX.1-2001.
 .P
diff --git a/man/man3/strcmp.3 b/man/man3/strcmp.3
index 0a573e52d936..2909a0b7ea64 100644
--- a/man/man3/strcmp.3
+++ b/man/man3/strcmp.3
@@ -16,6 +16,9 @@ .SH SYNOPSIS
 .B #include <string.h>
 .P
 .BI "int strcmp(const char *" s1 ", const char *" s2 );
+.P
+.BR #include\~<memory.h> "  // See STANDARDS"
+.P
 .BR "int strncmp(const char " s1 "[], const char " s2 "[], size_t " n );
 .fi
 .SH DESCRIPTION
@@ -107,6 +110,9 @@ .SH VERSIONS
 (If the two characters are equal, this difference is 0.)
 .SH STANDARDS
 C11, POSIX.1-2008.
+.P
+ISO C and POSIX declare both functions in
+.IR <string.h> .
 .SH HISTORY
 POSIX.1-2001, C89, SVr4, 4.3BSD.
 .SH EXAMPLES
diff --git a/man/man3/strdup.3 b/man/man3/strdup.3
index f3ab0611a323..c12cd3071dd9 100644
--- a/man/man3/strdup.3
+++ b/man/man3/strdup.3
@@ -16,6 +16,8 @@ .SH SYNOPSIS
 .P
 .BI "char *strdup(const char *" s );
 .P
+.BR #include\~<memory.h> "  // See STANDARDS"
+.P
 .BR "char *strndup(" "size_t n;"
 .BI "              const char " s [ n "], size_t " n );
 .fi
@@ -93,6 +95,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 POSIX.1-2008.
+.P
+POSIX declares both functions in
+.IR <string.h> .
 .SH HISTORY
 .TP
 .BR strdup ()
diff --git a/man/man3/strdupa.3 b/man/man3/strdupa.3
index 63b12c83e9ec..412eec9f3491 100644
--- a/man/man3/strdupa.3
+++ b/man/man3/strdupa.3
@@ -16,6 +16,10 @@ .SH SYNOPSIS
 .B #include <string.h>
 .P
 .BI "char *strdupa(const char *" s );
+.P
+.BR "#define _GNU_SOURCE" "  /* See feature_test_macros(7) */"
+.B #include <memory.h>
+.P
 .BR "char *strndupa(" "size_t n;"
 .BI "              const char " s [ n "], size_t " n );
 .fi
diff --git a/man/man3/strncat.3 b/man/man3/strncat.3
index dd39d54939d9..dc74e0fefbc3 100644
--- a/man/man3/strncat.3
+++ b/man/man3/strncat.3
@@ -11,7 +11,7 @@ .SH LIBRARY
 .RI ( libc ,\~ \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <string.h>
+.BR #include\~<memory.h> "  // See STANDARDS"
 .P
 .BR "char *strncat(" "size_t ssize;"
 .BI "              char *restrict " dst ", const char " src "[restrict " s=
size ],
@@ -57,6 +57,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 C11, POSIX.1-2008.
+.P
+ISO C and POSIX declare this function in
+.IR <string.h> .
 .SH HISTORY
 POSIX.1-2001, C89, SVr4, 4.3BSD.
 .SH CAVEATS
diff --git a/man/man3/strnlen.3 b/man/man3/strnlen.3
index 553a39a9ec7a..657fc8c7ae9c 100644
--- a/man/man3/strnlen.3
+++ b/man/man3/strnlen.3
@@ -12,7 +12,7 @@ .SH LIBRARY
 .RI ( libc ,\~ \-lc )
 .SH SYNOPSIS
 .nf
-.B #include <string.h>
+.BR #include\~<memory.h> "  // See STANDARDS"
 .P
 .BR "size_t strnlen(const char " s "[], size_t " maxlen );
 .fi
@@ -83,6 +83,9 @@ .SH ATTRIBUTES
 .TE
 .SH STANDARDS
 POSIX.1-2008.
+.P
+ISO C and POSIX declare this function in
+.IR <string.h> .
 .SH HISTORY
 POSIX.1-2008.
 .SH SEE ALSO
--=20
2.53.0


--ocdeakgdfku6i7wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptEUIACgkQ64mZXMKQ
wqks8w//UaqY5FZ2LwNeIbMYH/KSl2pdA7gjk237SL2m9Ci6E60iA3qAPJ7wv13r
qY1OxOCzrKmWHPA46Oc+sIk9/W9fvf/NXPaDUrvmczkSdxoHHN4nKVVnDIjx4+Uu
5Mca61Jv2vPct53bXQql4wdAcMjfHAZJ7fXTbV28LDKxaVb9EjJkGmu7aEnjIWEn
3fHOJBmAkStbuUSucIudm+mqMQNgpkVMwo6cpw9pJWlfNqvXHxCCIV+2EMcCq3AQ
eGnWyGzzKhGW7ysdizQlp/YTbnDAtXyn12eVz+5i0onCwqbAmlBH+AuhLBA+xyJ6
YeaKuWrCOlZ9A3t6NhkFcWbTCsC81UTNBtcsVclyUgCWy7Xb8UVpMkruBPPXCySF
Twn0SnsTrJmGADhXzNxPKvrXMIYRlgkOdALGb6DujabilUbkpIpmZTtpc/NjsY0u
9nK7PA9ea4rf5kvGmbx0whxdUvj86xVsVWEJXA4sA4YshmH6PyECweuSnJD0HQla
OFXkr0fk9vy5QOsq9JIpw2D0h0PLzocNabcC8TNIfwymEzkosD+nHjUYn4BDbaHU
/370Xj0xfpCYGBXDFz2iJM55riJrvEbNezqVSFRZXZJCVEIUWTGy+yWDwHlHzCUV
vcWMtvVaxDa695xsElhIpzYg7z3BtE9vwKOXEqQbomm2fPYL+vM=
=JOMS
-----END PGP SIGNATURE-----

--ocdeakgdfku6i7wy--
