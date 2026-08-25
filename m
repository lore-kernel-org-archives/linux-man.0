Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63173FB7E5
	for <linux-man@vger.kernel.org>; Tue, 25 Aug 2026 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787657301; cv=none; b=Iz4ux8x0DEkOV+mP+rlUNN5Y0bu8zXqf103aakIaJW7JiGDHZxOG+feEX+C31dnxrrQkdP1EiC/mSAGkWhHnhFotUoQxPNfaqZnyABFJADGfnDpSGCvnj8bT0yo0VoD35X0s071Q9DLCpw03CdOv+ISIAzuEiImdhQ6lbKjz+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787657301; c=relaxed/simple;
	bh=5qARe4EtnhI1FwYxApL+QSqFrQOaCZdXaq/qlY4zp5s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p5tAX10knCemU7oCDW6bD1L1Rx7OCcIeBYHgdFxm/Nmuf3HqepZY045XxQp+RbOmtXehzseBq0opIaDIURkvjTqdO77s3FV1WTiCxe33CqHKToKgV//q87qOsPhOOgAllW0eNq2hqlJ/B6UUgoRDkGKHZD/Xy2/ewUO9uVGTumM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8ppa9vT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8ppa9vT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F898C2BCFB
	for <linux-man@vger.kernel.org>; Tue, 25 Aug 2026 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787657301;
	bh=5qARe4EtnhI1FwYxApL+QSqFrQOaCZdXaq/qlY4zp5s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W8ppa9vTdJHrqKR3QLK7bIIUv5n8qOo0NBad+BFEtpGiABathhIYo21Y4L4q2bSdA
	 fY8+tOHQXBiRmVcbWdJkLBRIa93hr+f/A+IkzNGj0E44k7GajuoA2wCMao2sde58QB
	 g79BSFdGpZZrvQCwLh634/hOcrOOO7DtFtaDdj3cWL4mI5JPgI0d2bXOpJIG3OA2ul
	 HE+rdf4AfLJQbvS1zjStNFaMVOjXyL35d4lF7u+jbYLT7c5+gAFfldUUJ7YNohm0dR
	 jNuP2S5z3dH4DMBQHLESLCUevvYjxwek3EskN4VYcLMAF5bfJreEIPx4Hrk4tqIwA/
	 Hf4YHw4sT4zxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 45311C53BBF; Tue, 25 Aug 2026 11:28:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 218336] mount(2) doesn't document ENOSPC when
 /proc/sys/fs/mount-max is exceeded
Date: Tue, 25 Aug 2026 11:28:21 +0000
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
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218336-11311-EjmXOIeWaU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218336-11311@https.bugzilla.kernel.org/>
References: <bug-218336-11311@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218336

Alejandro Colomar (alx@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DOCUMENTED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
