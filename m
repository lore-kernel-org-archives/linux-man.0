Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792783674;
	b=WJzsxX2fnB7sA6/TM2pcV/++vAgooUQpNFdVQvto49N2FiORBjrnwMerqH3pHTayw62s
	 gsuzehYC0dn6iMvcBUqhWqElHISnwF2Kp5GfEfdSz58TIl65gJWVftxql5u6GDBvWZ0Ye
	 3FuoY0Zn/moFspMFBh5AyL7hv1z6h/l/omQBzh2Ss95t9OYtdxIeK/QjPb+D94XjLW7MW
	 EdTgGaWKEUaJ6daLSPokSh52Xxt0tbhVZMWaeElxy/ZLq0A+89IuEtYcnOWo8F4zX2VBw
	 MWEOOSirG8GURXxi9248mS23X8eEC9VNSZTF/D2gs6+DtLd1BM+ObWOuG2rInfHkqUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783674;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=I5/CK8QWQbIB70ifvfe9MGSseW/YvU52nXcVrD78fkY=;
	b=4VsWaNkTGEOTqlKyL5GrDXzPxqusojJ6BmnyRTcOV/FcUVJnSoIO35zVitH/Mha46HJR
	 cFV3+HXbH5qY5AONwRvV2bCoYQndRZlXjDNMTEzV9/yeyT4yWgxQRdQesMDQoUWGcq3tu
	 lP3wmgRLQ8ZLDnN630nwYANxCVvvaPqYRCsHypLQz4l+fzwk7QmPJCYjQGFSwpqxeq8dm
	 Tb7yp47g5AQ0gjmMmE4QaeikDaGv3PUwm9L7qmZvzKf8VqT41cjK28jAsTM6hQTQTQm5T
	 sdmh5/IRfQ5M+jwnKSwYv6TSJliKyY4SFszQ86KLX0pf/PL5x9kDPdyHD0aYN/mZI1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rFQTLILp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1335606A323
	for <linux-man.vger.kernel.org@localhost.mlmmj>; Fri, 23 Oct 2026 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rFQTLILp
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A875225771
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792783674; cv=none; b=iet3SyMZLNOxcL7Wr/oV0bnAwuvkknsjmJUN8OspK95wTnKKecJzn+BUv5vh6OMTnGwYP3ONNRypKTywgStNfpuuy5urq0CitFhWhC4nQA2Ck5mGyyV43WODxtTdTL7efi5F+pnTI70nEgXU/sfsbHLT/5svUnBhLPD8IfiSRaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792783674; c=relaxed/simple;
	bh=/UAsfwCMh5eIOL1VvAShSJfavJorBU7MmTQQhgd5iwg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JF/NbHqRbmevZ+onbAtmJsqHAvabiNHXqA/2pqke7b2xwxPZCWpzS9t3kT8l3Y3nT/MPKlPxYPmh8JCsineSGp93V2yEXrsm19WG9A/2l2rWwXNWh86uZvN6te2sNPPqzFSM8DgJeDHborD3Vumddktayoe5MVu9vXmUwd60gC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFQTLILp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29510C2BCFF
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 19:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792783674;
	bh=/UAsfwCMh5eIOL1VvAShSJfavJorBU7MmTQQhgd5iwg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rFQTLILpIowXUXy25E9wIl7UkbLawvWG2EJYXu2iALGIbLU9xaUvlha/JmX4xE26w
	 CgNHjxiMFheHULJelXFFDOtlj9JqdnQv6rKwi4Vnvt8jGGmznrpxl1SAdPOL69qIY8
	 mN6CdmrhVIw/mpxcUxPnj2hC/3z37Lb60fy1hUBS4GxRf1JH4GTlRwAcCvr0WYzSNI
	 8avhsDw8VuclPa9tmzcTnUhS6ORZDCQ4PZuZsBbVVuqN633UeHjsFxklP9eh+ay8Mo
	 hrofo0sQ3ScntliQiLHeaMx2C4nrnQ/nGCeWcKZ3zeCQfOy866B6rtY2dC35qMI/7P
	 EvJs5tRQ5cGtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 06B09C53BC9; Fri, 23 Oct 2026 19:27:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 222094] sched_setattr: bug in `ERRORS` section w.r.t.
 `attr.sched_flags contains a flag other than SCHED_FLAG_RESET_ON_FORK`
Date: Fri, 23 Oct 2026 19:27:53 +0000
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
Message-ID: <bug-222094-11311-6inWen38Cw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222094-11311@https.bugzilla.kernel.org/>
References: <bug-222094-11311@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222094

--- Comment #3 from Alejandro Colomar (alx@kernel.org) ---
Hi,

> Date: 2026-10-23 18:47:22+0000
> From: bugzilla-daemon@kernel.org
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D222094
>=20
> --- Comment #2 from Enji Cooper (yaneurabeya@gmail.com) ---
> Created attachment 311258
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D311258&action=3Dedit
> Patch
>=20
> I've honestly never submitted a patch to the Linux mailing lists. There a=
re a
> lot of hoops to jump through in order to make a contribution... I'll try,=
 but
> please bear with me (I'll probably get something wrong).

Sure!  You're welcome to try.  :-)

I've forwarded your patch to the mailing list in this email.


Have a lovely night!
Alex

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
