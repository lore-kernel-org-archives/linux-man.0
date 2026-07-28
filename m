Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB442902A
	for <linux-man@vger.kernel.org>; Tue, 28 Jul 2026 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240369; cv=pass; b=C+QXafCDwjzwHEejS2Tv3P3mv1BROOUo+vjnGyegDBhsWP1pK8p0Rn1lNUHSkWoZrxVFPx2GrU1cImkzl5VR4bFfmLP3wzzj9J9aoCOUVKdWG8CLoM1tmJ/6UPl7MDkHKn8jKElF1ueoIrUPhfTviGS1NIobV3V55kEL21snGlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240369; c=relaxed/simple;
	bh=xtU47pbObU1bE4jfIRvt4Nnb8nmjwjPvok+PeZpUIQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7UFYmRAxMz6oR9FcbE8wM3VeYOWQ7q1TcYDbtDVYREyP1QD3bCzVzPG45rR7gFlhj/td8OvA0tpG9vt8OUbYtViE7hkpGUaC7yvApzslEghKqc/nDkz9YwjdL+QUi2bKAMHrBdQiGN8bVVBEZbqoZEpXd6CobcNjKUWsE9K0OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmNADF08; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmNADF08"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so4261356e87.3
        for <linux-man@vger.kernel.org>; Tue, 28 Jul 2026 05:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785240365; cv=none;
        d=google.com; s=arc-20260327;
        b=ldna6CYQQRc0jLmUDbD5e1erenwd/jpHqKzQYpCeL9oTmAwM20R1UGkNlHOIEPXckU
         f1CS4WZOKALQlOQqvJK3qYXFwfpikguIPS2SjFdNddJPvcEzGR0zzgbYimdNOWYTvV+T
         XHpO72J27vMN3qhXVPqLd4Sk1B3HsGPzrGlOCcnMSDn1B3OmNww50YHYOZINKxnrzuT7
         MXJSgyk2KqOEl3xxWd54bRvl5Uc4sUBvOZ3s6ABfK9q/1yWnPaLRgpLqCuhN/7kkuEOJ
         LI6F+ct7fgskUsov8S63sg5yF6wfeN5kIbthpjkLZIqVCdcdPSbT4Odj7Focn7ZJY0KL
         R65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FvE0ViRrsU/oS9brMMCXCMt5F5LviBUtc5FRCyGW6xs=;
        fh=SggVTg5fVpLIo48TsO3LbJ/UP9XpuNtVqAcyxMkkRJw=;
        b=merpm84blrW7wOVF1/z2JTu2287P/WhEcE8eIR9GdE9owrFtkdUUfqp00374wh3pt6
         Xw3AGom1MkXp2zVbIJqSgBbWzgFtrm9Wr/iKf0ZGxtt5eW0in4hytcZ1ev9MpoG5Qj3v
         DeiVp57gNhC7w8HLwjM+OhQPE0v6qBUzoa+fYQLWzrWuyoDUmiGVVXnlX3COHq6xCbbX
         n5A4br1df76f/PD/9hZfZvCPDlroEfs7jaq2cBPoS3ZDSiJMrMA/lR25ZV5cV6GIaqIE
         yqhNGycNlhfuGpVv2We6p6ftYvwnBw1tsGVTpfCnRTCEWgoPYu+69/Ew6eKzb77xw4Uh
         RB9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785240365; x=1785845165; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvE0ViRrsU/oS9brMMCXCMt5F5LviBUtc5FRCyGW6xs=;
        b=qmNADF08gKfnUns3PPuFEohAJnie7pkfsMzFsopK9P/la4DJCEWdc6eau0dmCrw87Q
         EE796OnVZyUy920AB46FBeUSBlVStBQgkw77PR1UCenJUThLqmfQd+QwG4ujKQEX4Mj4
         MH7P/jf/QnC9K104WmzpQtcXzrzpAlfiFLPED9m1ylYlaaFXsjlqDuvTTdGPBcf/0LCs
         m9AY37xCTk/4gV/Jt7QhN8Q10kQQKnGUpQJfUF7/VaTFz6m/KWb1JGyBreuiGNxXuu4K
         0rNvAezU6rBy2bt7YsRNSkIbO9C4fK90gqLwojWbJ8FO6UPxcSIisFplEBJSphdM48Xq
         htOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240365; x=1785845165;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FvE0ViRrsU/oS9brMMCXCMt5F5LviBUtc5FRCyGW6xs=;
        b=XZr60KoM054cm8D9725LrIbCuLFmlQiae4lRx1jRl9VuplGgp8JDMhqy/ClsL8ZR/E
         4hJ1Z2CQ6xmlbn1UvJW9dyoa7ROdFmfI1do+pJHk9W9+nxdTb2Zuz19GDZnnBRJBeqdt
         F/SN14Ra/B7iLVu4+Ve9an0nTShXXG+oFlTpPhxE1dDcQeEIghRY4Jb/WfTy26KK11zH
         dJ2UkmpiRmZgG8qDSWsIFg2qF3ptpHBLA7usosZ0YAV0KiFNUzmlZx6qZqv1/ah/WCra
         GllzQ7wanxSBk+eYXlFxU9QQi9UNUA4yqci2zTOLooHWyd6QNToRKkM2ZR+R2URUxaVq
         9DkA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7+WK7J48PGsKP3BygvVJoiVFNuOqM1kih8BUz8DtAqV3O9BTOxWy4XeNZoLLcPmTpgrgOKYvoSx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcNGRdmuLyhhfJzcI+w5tPAVlLeY7cgKMhx75qBpqZosnSbNuj
	F3MClfWC3zzlx1sfP4JFD1vz/HS8qYsjkl1RxgISCdqAC9aWyjPi2siz8cPQIG1gUYmcpot+G6+
	XSr5ZN4G8pCEypSOyBumCe6AUFyXXv/UwKg==
X-Gm-Gg: AR+sD10BeipuzgIoBXqEL/c1lDNZXHwc7KuiF7sGvIMQ1aF4Xfe0+7LKsgcGPoNLkiI
	W6njAKrqqTudWunWrZVtoPaFEyg9IdR7Dp0s+LyH3j5B9pkALNWckTlYedhBfWFisPAMTubfOc6
	V7ziQIofJqgNI8QrJpG+Ek+YNrwWk1eCg7YG42Pkj1pBiRl65/fMz1i1rD2SfJgHBG/ornnyNDs
	xp7FqvT1O/EYyaHuS0UUZcU1Z4o1JAm+hwpNLoGKk1kyOCdniX0V9eq7s8NOiCSAp4/bMYwQ5qx
	vq2CqDxnvRmZeL6d
X-Received: by 2002:a05:6512:b8f:b0:5ae:b6b1:5fcd with SMTP id
 2adb3069b0e04-5b2d011598cmr482206e87.10.1785240364952; Tue, 28 Jul 2026
 05:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org> <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com> <amUw8ArFwmnsIKl1@devuan> <amaTpQxd52iYjlor@devuan>
In-Reply-To: <amaTpQxd52iYjlor@devuan>
From: Mark Harris <mark.hsj@gmail.com>
Date: Tue, 28 Jul 2026 05:05:51 -0700
X-Gm-Features: AUfX_myLSmPXWvX3IqwzxmUErZN-pEU-AWRup9_l1B_ea4Z02dI8tS2lDT5Dguc
Message-ID: <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
Subject: Re: alx-0096r1 - string (and nonstring) copying
To: Alejandro Colomar <alx@kernel.org>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Content-Type: text/plain; charset="UTF-8"

Alejandro Colomar wrote:
> Description
>         There's a recent push to remove strncpy(3) from the ISO C
>         standard without carefully analyzing the consequences of the
>         removal.  There have been informal messages from committee
>         members in the mailing list, and now we have an N document that
>         will be heard in the next meeting:
>         <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3935.htm>
>
>     N3935 (2026-07-15; "Removing strncpy")
>         N3935 contains some truth and good arguments in it, but it is
>         mixed with some mistakes too.
>
>         Below is an attempt at carefully analyzing the history of this
>         function and why it has been misused, and also a thorough
>         analysis of the replacement candidates.
>
>     Seventh Edition Unix; strncpy(3)
>         strncpy(3) was first introduced in Seventh Edition Unix (V7).
>
>         It was added for one very specific use case: copying a source
>         string into a destination character sequence in a fixed-size
>         member of a structure (not a string), and padding the unused
>         bytes with '\0'.
>
>         This was useful bad then in members of the utmp(5) structure,
>         and modern shadow-utils still need this function for dealing
>         with utmp(5).

It used to be much more common.  For example, in V7 Unix there was
only one filesystem type and no opendir()/readdir(); any user program
wanting to read the contents of a directory would open() it for
reading like any other file and read the sequence of 16-byte directory
entries, each of which is a 2-byte inode number followed by a
fixed-size 14-byte filename.  A shorter filename was padded with null
bytes at the end but there was no null if it was exactly 14 bytes (the
maximum length).  strncpy() could write this kind of fixed-length
field, and strncat() could append such a filename to a path string.

At https://softwareengineering.stackexchange.com/questions/438025/what-was-the-original-purpose-of-c-strncpy-function/450802#450802
the original author (or so they claim) says that the original
motivation was to handle the fixed length command name in process
accounting records.

>
>         While programs should avoid non-NUL-terminated character
>         sequences (aka, nonstrings) within fixed-width structure members
>         in code that is used only internally, this is sometimes
>         necessary in structures that are part of a protocol.  Thus,
>         while this is a niche use case, it remains something that some
>         programs need to do, and need to do reliably and safely.
>
>         Another program that needs this functionality is tar(1) (from
>         what I've heard).
>
>     System V; mem*() functions
>         Back in the times of V7, the concept of a string was less
>         specific, and what we now call byte arrays, they called byte
>         strings.  In fact, memcmp(3) was then called bcmp(3).  That's
>         why all the byte functions are provided in <string.h>.
>
>         System V invented the mem*() functions --AFAIK--.  They are
>         essentially the b*() funcitons from V7, with minor tweaks to the
>         parameters and return values.  For example, memcpy(3) was made
>         consistent with strcpy(3), in that both take the input as $2
>         and write to $1.  The old bcopy(3) was reversed compared to
>         strcpy(3), which was quite confusing and error-prone
>         (especially, before 'const' was invented).

It was 4.2 BSD that introduced bcopy/bcmp/bzero in libc, the same year
(1983) that System V introduced the mem*() functions in their libc.
V7 Unix did not have any of these functions in libc, although it did
have a bcopy() function in the V7 kernel so BSD may have been trying
to be compatible with that.  4.3 BSD (1986) then also added the mem*()
functions for System V compatibility.  Later the C89 committee chose
to standardize the mem*() functions but moved them from their own
header file memory.h (introduced by System V) to string.h with the
str*() functions.

>
>         POSIX says memcmp(3) was first standardized in Issue 1 of the
>         SVID (System V Interface Definition), which corroborates that
>         these functions were invented in SysV.
>
>         It is good that such a renovation of the names, parameters, and
>         return values happened.
>
>         It would have been good if strncpy(3) and strncat(3) would have
>         been renamed (and tweaked) too back then, but it didn't happen.
>
>     C89; string
>         C89 specified the term 'string' very clearly, in 4.1.1:
>
>                 A string is a contiguous sequence of characters
>                 terminated by and including the first null character.
>
>         This differed from the old ambiguous meaning.  The header file
>         for operations on byte arrays remained <string.h> for historical
>         reasons, even if it conflicted with this specification of
>         string.

When System V introduced the mem*() functions they put them in a new
header file memory.h.  Also when 4.3 BSD added the mem*() functions
for System V compatibility, they added a memory.h header file with
these functions and did not add them to string.h.  When C89 adopted
these functions they moved them from memory.h to string.h; they did
not "remain" in string.h since they did not start there.  Modern Linux
and macOS have a memory.h that includes string.h, for compatibility
with code that may still include memory.h, even though no version of
ISO C or POSIX has ever required a memory.h.

>
>         The strn*() functions, strncpy(3) and strncat(3), also remained
>         with their names, for historical reasons, even if it conflicted
>         with this specification of string.
>
>         Other than that, the standard was quite consistent and strict
>         with its meaning of the term string.
>
>         I believe this consistency --with the exceptions mentioned
>         above-- is what led programmers to trust string functions to
>         handle strings, and anything with a str*() in the name was
>         believed to be good for handling strings.  Programmers forgot
>         the not-so-consistent history of the term string prior to
>         standardization.
>
>         In retrospective, the strncpy(3) function would have been better
>         called strtomem_pad(), which clearly reflects what it does.
>         Maybe that would have made programmers aware of its semantics,
>         and it would have significantly reduces misuses of the function.
>
>     strncat(3)
>         strncat(3) is similar to strncpy(3) --while at the same time,
>         very different--.  It is actually the opposite of strncpy(3):
>         it takes a nonstring as input, and writes a string.
>
>         A better name for it would have been memtostr_cat().
>
>         Curiously, there's no 'cpy' version of strncat(3).  There's
>         nothing with the semantics of memtostr() in ISO C, nor in the
>         historic Unix systems (V7, BSD, System V).

I think the main source of confusion with strncat() is that for other
str*() and mem*() functions that take a destination buffer and size
argument, the size is the size of the destination buffer (i.e., it
will not write to dst[size] or later), whereas for strncat() the size
only limits how much is read from the source.

So what I find more curious is that ISO C has no string concatenation
function that takes a destination buffer size (such as your
strtcat()).  If that is what a person is looking for, the plausible
name and arguments and absence of other contenders can lead them to
conclude that strncat() must be that function.

>
>     strn*(); [[gnu::nonstring]]
>         In general, the names of strn*() functions are unfortunate,
>         because they are better suited for handling nonstrings
>         (character sequences that don't fit in the standard
>          specification of 'string').
>
>         GNU C has the attribute [[gnu::nonstring]] to annotate these
>         things.
>         <https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-nonstring>
>
>         While renaming the functions would be better, one can think of
>         the 'n' in strn*() as a mnemonic for NonSTRing.  This partially
>         mitigates the naming issue.  Still, better names would be much
>         better:
>
>                 strncpy() => strtomem_pad()
>                 strncat() => memtostr_cat()
>
>     Linux; strtomem_pad()
>         Recently, it appeared in the (fake) news that Linux had
>         completely removed all uses of strncpy(3), and banned it in new
>         code.

Perhaps clarify that you are referring to the Linux kernel, not Linux glibc.

> ...
>         Thus, the functions that should be considered are:
>
>         -  strtcpy()            (strscpy(9) in Linux)
>         -  memtostr()           (the 'cpy' of strncat(3))
>         -  strtomem()           (strncpy(3) renamed)
>
>         And for consistency, strncat(3) should be renamed to something
>         like memtostrcat().

Given that the entire point of strtomem() and memtostrcat() is to
change a confusing name, I am surprised that the new names you came up
with name mem and str in the opposite order that they apply to the
argument list.  That is, memtostr(str, mem, n), introducing a whole
new area of potential confusion that was not present in any existing
mem*() or str*() functions.  If reducing potential confusion is that
important I would have expected maybe strfrommem(str, mem, n) or
similar.

>
>     strncpy(3), strtomem(), and truncation
>         One thing we should consider improving if we'll have a breaking
>         change is to report truncation.
>
>         strtomem()/strncpy(3) necessarily truncates if the string
>         doesn't fit.  However, it doesn't report truncation if it
>         happens.  Since the return value of strtomem()/strncpy(3) isn't
>         very useful, we can take advantage and modify it to return an
>         error code if there's truncation.  Let's return NULL on
>         truncation.
>
>     shadow; strtcpy(), strncpy(3)
>         The shadow project more or less agrees with the Linux kernel in
>         this regard.  It has implemented strtcpy(), and uses strncpy(3).
>         It doesn't have memtostr() yet, because it happens to always
>         allocate the buffer at the same time, using strndup(3) --which
>         is essentially malloc(3)+memtostr()--, but that will change
>         soon, because (non-VLA) arrays are safer, as they allow
>         validation of source and destination sizes at compile time.
>
>         The implementations are independent, and happened to be
>         fundamentally identical.  It seems that good implementations of
>         string and nonstring copying code converge to this set of
>         interfaces.
>
>         Here's a naive implementation of strtcpy():
>
>                 ssize_t
>                 strtcpy(char *restrict dst, const char *restrict src, size_t dsize)
>                 {
>                         bool    trunc;
>                         size_t  dlen, slen;
>
>                         if (dsize == 0)  // UB
>                                 abort();
>
>                         slen = strnlen(src, dsize);
>                         trunc = (slen == dsize);
>                         dlen = slen - trunc;
>
>                         stpcpy(mempcpy(dst, src, dlen), "");
>
>                         if (trunc) {
>                                 errno = E2BIG;
>                                 return -1;
>                         }
>
>                         return slen;
>                 }

ISO C does not have ssize_t or E2BIG.  Also this API does not handle
the case of slen too large for ssize_t, which may not be an issue for
Linux, however ISO C has to support a much wider range of systems.
The same issues apply to strtcat().

>
>     shadow; strtcat()
>         A cat version of strtcpy() is also useful.  The Linux kernel
>         seems to be misusing strncat(3), because they took priority on
>         addressing misuses of strncpy(3), but it would do good in also
>         replacing misuses of strncat(3).
>
>         shadow does have strtcat() --although the number of uses is way
>         smaller than those of strtcpy()--.
>
>         Thus, for consideration:
>
>         -  strtcpy()            (strscpy(9) in Linux)
>         -  strtcat()            (the 'cat' of strtcpy())
>         -  memtostr()           (the 'cpy' of strncat(3))
>         -  memtostrcat()        (strncat(3) renamed)
>         -  strtomem()           (strncpy(3) renamed)
>
>         An implementation of strtcat() is:
>
>                 ssize_t
>                 strtcat(char *restrict dst, const char *restrict src, size_t dsize)
>                 {
>                         char  *p, *end;
>
>                         end = dst + dsize;
>
>                         p = stpecpy(strnul(dst), end, src);
>                         if (p == NULL)
>                                 return -1;
>
>                         return p - dst;
>                 }
>
>     SEI CERT STR32-C
>         SEI CERT --which supposedly is a "secure" coding guideline--
>         recommends using strncpy(3) for copying a string with
>         truncation.
>         <https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-standard/rules/characters-and-strings-str/str32-c/#compliant-solution-truncation>
>
>         This is the kind of bad teaching that has had the negative
>         effects we have today.  Programmers misuse tools like strncpy(3)
>         --among other reasons-- because they're taught by SEI CERT and
>         others to use those tools for something they weren't designed
>         for.
>
>         SEI CERT STR32-C proposes this code as correct code for copying
>         a string with truncation:
>
>                 size_t func(const char *source) {
>                   char c_str[STR_SIZE];
>                   size_t ret = 0;
>
>                   if (source) {
>                     strncpy(c_str, source, sizeof(c_str) - 1);
>                     c_str[sizeof(c_str) - 1] = '\0';
>                     ret = strlen(c_str);
>                   } else {
>                     /* Handle null pointer */
>                   }
>                   return ret;
>                 }
>
>         I claim that that code is bogus, and that good code for doing
>         that should instead look like this:
>
>                 if (strtcpy(buf, source, countof(buf)) == -1)
>                         goto trunc;
>
>         That's one line that does one thing and does it well.  It takes
>         an input string, and copies the string into an output buffer,
>         truncating as necessary, not reading more than necessary, and
>         not writing more than necessary.  It reports truncation if it
>         happens, because truncation is usually a bad thing.
>
>         For that, one must implement strtcpy() (see above for an
>         implementation).
>
>     System V; memccpy(3)
>         memccpy(3) was invented in System V (like the other mem*()
>         functions).  The System V sources are not public (AFAIK), so
>         it's not known what this function was designed for.  It was
>         later added to the BSDs and glibc for compatibility with SysV,
>         but nobody really knew what this function is good for.  It
>         doesn't seem ergonomic for any basic functionality.

It is for implementing functions like fgets(), which needs to copy the
next '\n'-delimited line from a buffer filled by read() (so not a
null-terminated string).

>
>         Ignoring tests, you can find 0 calls to memccpy(3) in NetBSD,
>         and 3 calls in FreeBSD --two of which are in two repeated
>         implementations of strncat(3), and the other one is really
>         unique, in "bin/sh/parser.c"--.
>
>         Debian shows several more uses of memccpy(3) that are not in
>         tests, but all of those seem to be newer than C23, so they seem
>         to be cases of "if C23 added this, it must be good, let's use
>         it" without really analyzing whether that function was actually
>         good.
>
>         These two unique calls found in NetBSD are *terrible*.  By
>         *terrible* I mean as bad as misuses of strncpy(3).  They show
>         how error-prone memccpy(3) is, even for the most natural use
>         cases.  Here's one of the examples:
>
>                 if (fmt[0] != '}') {
>                         char *end;
>
>                         end = memccpy(tfmt, fmt, '}', sizeof(tfmt));
>                         if (end == NULL) {
>                                 /*
>                                  * Format too long or no '}', so
>                                  * ignore "\D{" altogether.
>                                  * The loop will do i++, but nothing
>                                  * was written to ps, so do i-- here.
>                                  * Rewind fmt for similar reason.
>                                  */
>                                 i--;
>                                 fmt--;
>                                 break;
>                         }
>                         *--end = '\0'; /* Ignore the copy of '}'. */
>                         fmt += end - tfmt;
>                 }
>
>         This is the most legitimate use case of memccpy(3) that one can
>         conceive: we want to copy the leading part of a string until a
>         delimiter character is found.  And even this use is full of
>         opportunities for off-by-one bugs.  A better design would have
>         not copied the delimiter, allowing the user to decide whether to
>         copy it or not (instead of forcing it to go back and remove it,
>         which is more complex).
>
>     POSIX; memccpy(3)
>         POSIX standardized memccpy(3) just because it was in System V.
>         POSIX derives from Issue 1 of the SVID.  It's not surprising
>         that it's there.  Especially, this function was always in POSIX,
>         and the early revisions of POSIX are known to have strong
>         preference for SysV functions, regardless of their quality or
>         widespread use.
>
>         Interestingly, POSIX mentions that memccpy(3) does not check for
>         overflow.
>
>         > The memccpy() function does not check for the overflow of the
>         > receiving memory area.
>
>         This is because the 4th parameter to memccpy(3) is not the size
>         of the destination buffer, but the size of the source buffer.
>         It is assumed that the destination buffer is large enough.

That is silly; the maximum size applies to both the source and
destination, like memcpy().  Obviously if one is smaller than the
other, you must not pass in a size that is larger than the smaller of
the two, as with memcpy().

>
>         This hints that the original (System V) authors of the function
>         didn't consider copying strings as a use case for this function.

It's a "mem" function, not a "str" function, so it should be clear
that it is intended for processing byte arrays and not null-terminated
strings.  That said, if you wanted to I guess you could use it to
implement a function like your strtcpy() pretty easily:

    if (dsize == 0) abort();
    char *p = memccpy(dst, src, '\0', dsize);
    return p ? p-dst-1 : (dst[dsize-1] = '\0', -1);

Note that this just passes the destination buffer size directly to
memccpy(); unless I missed something this should not allow the
destination buffer to overflow.

I don't see sufficient justification for removing this function.


 - Mark
