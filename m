Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF5443F08C
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 20:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232534; cv=none; b=r5vCnc1LOUBRZLohNhVRSbiYf4ZUQuKnqfz/FT6uOT1AkcBjHSkutHfM7HDIaxcf9TRrBLrRXUIOpe3ZHImtZ2k/a8H6I9GQ9viuDxh17pi4OZav1LCxzZu7+uLXB/d6SG8NBCgLoEbfFZoHMTyIG/12EPTKe2Co/2K1tIf1gB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232534; c=relaxed/simple;
	bh=aQ0pGwcNUMXKLkMdfWiUNoMbMmmy4lFGd6P0g3RsqQ4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=slWBDfEFL0pWJAXR50Ihg1GjPg9t63GLOckzrImqIbCeeRyLQ9aRhqK8GH35Qbja2JzmzhrlVzH0wzSJ+vamaeeD1NUEOHQfvSFlboe6bkzhHAFHl1UcsbeaaKTSsdTWQzZXjhImWhhD7LHqsNOr+yvHF7BQXnlzOEqs1uuQ2Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWfoXaxW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWfoXaxW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3242AC2BCC9
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 20:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784232534;
	bh=aQ0pGwcNUMXKLkMdfWiUNoMbMmmy4lFGd6P0g3RsqQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nWfoXaxWe0qAgiSYPHE29WoDdJlC3nujpTy2FvQXESkWSdRTz4MEX7QKa+wIq+p9C
	 k1cEVQ2ivm2QhwcKysXBQfQsOz6PS/en1OPxYKHPQc6c7GmpZWpDBtBG8WWTmwT6nF
	 k+XyfitzjTPVe98V3aGnFs8STRrdPvhQjLCAo433ooQuAlrJ/jH8bwlsoD5WqigQv4
	 kYQfEL49HSP9Vq7C/hlIwQAA9YXVQmoc2Q0iZwXjTX3gVApdropbQRDWr5Uh4PxVnJ
	 65K61C5IAA97u1GGNUkyrNszWTWmiMSm/0z9Obw9TlNSTU4/mkgKMNnC5FxpoMWRqv
	 6uvPO4/MkDFHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 15F72C4160E; Thu, 16 Jul 2026 20:08:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3MTVdIOKAnG1ha2UgLVIgYnVpbGQtcGRmLXBhZ2Vz?=
 =?UTF-8?B?LXRyb2Zm4oCdIGZhaWxzIHdpdGgg4oCcd2FybmluZzogdGFibGUgcm93IGRv?=
 =?UTF-8?B?ZXMgbm90IGZpdOKAnQ==?=
Date: Thu, 16 Jul 2026 20:08:53 +0000
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
Message-ID: <bug-221715-11311-hZafVq8Yuj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221715-11311@https.bugzilla.kernel.org/>
References: <bug-221715-11311@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221715

--- Comment #3 from Alejandro Colomar (alx@kernel.org) ---
Hi Branden,

On 2026-07-16T19:53:27+0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221715
>=20
> G. Branden Robinson (g.branden.robinson@gmail.com) changed:
>=20
>            What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>                  CC|                            |g.branden.robinson@gmail=
.co
>                    |                            |m
>=20
> --- Comment #2 from G. Branden Robinson (g.branden.robinson@gmail.com) ---
> Hi Alex,
>=20
> This seemed to do the trick for me.

Would you mind sending a patch in the list?  Especially, please document
in the commit message what this is doing and why.  :)

Is this the only page that needs to be tweaked?


Have a lovely night!
Alex

>=20
> diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
> index 2fa8368e1..5c0508d4e 100644
> --- a/man/man4/console_codes.4
> +++ b/man/man4/console_codes.4
> @@ -413,6 +413,8 @@ .SS Linux console controls
>  set background, same as 40..47 (bright not supported)
>  T}
>  .TE
> +.br
> +.ne 4v
>  .P
>  Commands 38 and 48 require further arguments:
>  .P
> @@ -762,6 +764,8 @@ .SS Comparisons with other terminals
>  T}
>  ESC ] 50 ; \f[I]fn\f[] ST      Set font to \f[I]fn\f[].
>  .TE
> +.br
> +.ne 4v
>  .P
>  It recognizes the following with slightly modified meaning
>  (saving more state, behaving closer to VT100/VT220):
>=20
> --=20
> You may reply to this email to add a comment.
>=20
> You are receiving this mail because:
> You are watching the assignee of the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
