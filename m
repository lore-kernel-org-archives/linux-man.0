Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3655405C53
	for <linux-man@vger.kernel.org>; Sat, 16 May 2026 16:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778950662; cv=none; b=tdHuOW1YLUBVxYQ/RzDGiG/GBmkHZD0Laay3KNEMXF08JS912u3vNK+VSVicwFdw8hr+3jCzAsi08f250cT8PErPq9YWEM4VuIdaC2F97dUu2MHBipSY+aQ7ewJT5n9ZysQKsWu9eXJt7C9ZKbzYwMIsI8dy2arjj+1YGoUNbMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778950662; c=relaxed/simple;
	bh=ycQlcvn+eiAt1HgHWn0dDGBp6tdnK85lObbpe8UbBHQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ww1eNyPjdn8NShvWVCmDc3bymKKlT3bwylnz49P4NT4lY54KGLY2dZ0+0Y+yd4tfCLlowiGRDW/cQPALAIHhTMu1sKtBz6oj+EZRHacT3ir+vJYV5IwHCZVmnPWkRoB8IbbDh9y6CJ+VQX+wy790kgt3irpTW3oR8jn4FGQkR38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMKsdAqA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMKsdAqA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71403C19425
	for <linux-man@vger.kernel.org>; Sat, 16 May 2026 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778950661;
	bh=ycQlcvn+eiAt1HgHWn0dDGBp6tdnK85lObbpe8UbBHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DMKsdAqAXNvVOumrK3Ve9DVJp8n1aRuEyQWQcxRLzzcbIRE1MmNbLApGicIijCre3
	 rpU1Qjy/sQD3ZG74QzLLqsYWoHVKkv2cid9BaopAgSnNAjCTr8YeXVXk0vOXCISQ6P
	 ffVg+cGz7S6/sNB9TrRaFUZUd7UCt5dWxlx0LuEmWr0FWbQ7b5Q9+h8+nRbTJ1WQha
	 7fKqqZ9hOI4B2JaFL2HilrlrHBaVxKHfIJ6x97t+JsC1o7CwrDYobfylRqmtj9hdBL
	 yQPKwQ70HUWuGH0PMlT/9xoNdzyeOYlddwoeKmiVN3l57TWofxwA+0VrUf7PjLCFDG
	 n1532vGx6SWDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 626ACC53BBF; Sat, 16 May 2026 16:57:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 221533] strstr/c23/constness
Date: Sat, 16 May 2026 16:57:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alx@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221533-11311-aO63pl4r9F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221533-11311@https.bugzilla.kernel.org/>
References: <bug-221533-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221533

--- Comment #1 from Alejandro Colomar (alx@kernel.org) ---
Hi,

On 2026-05-16T16:47:42+0000, bugzilla-daemon@kernel.org wrote:
> Hi,
>   In C23 strstr can return a const char* if the first parameter is a const
> char*;  this is also true of a bunch of the other routines.
>=20
>   I'm not really sure how this should be documented, I guess two entries =
for
> each function with some note saying it's only C23 and later?

I've been thinking about this.  At the moment, I've documented one
function that has this property: strnul(3) (which is a gnulib extension,
not part of C23).  There, I've used C++-style, documenting it with two
prototypes, as if it were a function overload.  I think we should do the
same for the C23 const-preserving macros.

        SYNOPSIS
             #include <string.h>

             char *strnul(char *s);
             const char *strnul(const char *s);

I'll work on some patches for the C23 APIs.

> See:
>
> https://sourceware.org/cgit/glibc/commit/string/string.h?id=3Dcd748a63ab1=
a7ae846175c532a3daab341c62690
>=20
> for the glibc change that implemented it.
>=20
> It can break some existing code, e.g. something like:

Indeed, it broke mutt(1), for example.  That allowed finding a few bugs
in mutt(1), which were modifying read-only strings.  Most of the cases
were false positives, though, which could be fixed easily by adding
const.

> int foo(const char *a)
> {
>    char *bar =3D strstr(a, "frog");
> }
>=20
> gives:
> t.c:9:16: warning: initialization discards =E2=80=98const=E2=80=99 qualif=
ier from pointer
> target type [-Wdiscarded-qualifiers]
>     9 |    char *bar =3D strstr(a, "frog");
>       |                ^~~~~~

Yup.


Have a lovely day!
Alex

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
