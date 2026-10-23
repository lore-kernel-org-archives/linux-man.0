Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792781244;
	b=XwItFoiHI6wxOPEbnbKpBMlhT6eGLMQF+9iwrNdz7yfwmUekJuo/p+niPLvQ6iukrHWg
	 QQStfcZRkRA6V4xFX26+siu7MjxC6ei5Zdj99Ml8+c3DqZ5I5FTNVmt6qL8yfzNfhQAg6
	 MMp345DCGrMt1R1Ykm+aoia/3GMrSagrv1tWlBrWfaI0VqWPuPyZMfl/9xnYpZHDgCsXk
	 +gRLXQEI6/JfyMufHrfQUt30ifaCvnVEqodFMto2pcl81LSo55A04eKBVLMI8hFMkJ2U+
	 L3tzoBzdOdtgSB2Qo4dOyVCPAs+Ag4/XLziXSMQU7qFwi7FWeciIg8+Jvfp74fdU28g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792781244;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=lSd5p3Lrck0yXKOheKyRbzQXrCoEk02iPW8QK5ANw3o=;
	b=H91d7v4lsEeuYQkEqUXcF29bIuuk9D7TTt9dpd/+eMODsPJf4HJj+3QLZtoc/9GUz1HI
	 bpA+VZyHvdNpRKxJo82pPSuU6CpTDLYR9V74aX3Bpkv3skUlNWtKo36XvqkSJkVHaActI
	 7a4wzlKpyYUYMLSMSr2b5GTD72kvt6vPQNX3aLDmhSwRRL4Tm61O8xffusGHR2hVk3ao8
	 Xf4+kTAiJprMEK3YQCQK+LTUgRBiEHxVSmT/21nF4zeAilHN2UyyX2iZ0DzBXlgXwzwIT
	 Q8d746N3ZCURnZVRwmWGtsk9Z9WcJQi4OpYvDRp+zUxmNROr7TcaSEVuKQnLI6wnJWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b="diqAueB/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16482606A31A
	for <linux-man.vger.kernel.org@localhost.mlmmj>; Fri, 23 Oct 2026 18:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=diqAueB/
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E127925771
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792781244; cv=none; b=JQ+ZHa5CQdCCNMQ4c5HpVTaFRBFYGwE8OmtxqeQMD++PDg5u10DZwkyI8VWAxdtM1CAabIbCR5x+3vzdtJbaiiGVuYNtkMJXXtta93oJLap6KFzgHiVyqSAG4OCH22F7ikNODrSxEeBn2aNKfy/AU7lA4JXK9FIBfwgGmi2mrts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792781244; c=relaxed/simple;
	bh=MhIID3X12y1+IOHp/7gDcYQLryOTsAfVALFHgCpCUgY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h/iE6OASKMVry3uwbY3/D5r+fIQLp9zzHdw8EbEf/jn0uMtS+kJClQybt1iIadWJNs1G3FdE5TBOBAKIyDtCkr8nSLX2GJzH75XAZIbrBSnr7smxAULF8byq90b1ZkjdZbuAQgrNELh+AfXnDcC19qqmh821/k6pdzK9Nv2p5BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diqAueB/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54980C2BCFA
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 18:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792781243;
	bh=MhIID3X12y1+IOHp/7gDcYQLryOTsAfVALFHgCpCUgY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=diqAueB/QlrdUThIlrf5OoXEcL9DT2HMHmNfWKwhvCYV0aevJG37JKVYXNLoztd5R
	 GX+zSfktPRgV2Mv6lx5FG1qJhq7H4cJgwiqA2gvmUBNQ7MPnIoMDTCro289fcwHMyY
	 liH0WoyysqswpiCGK0DzRXAYdV7qRSGMG6H1N2OmfAkplFzfvpxY1J58wIK4B9kv9y
	 /ETvEGQ1ELgcme4mHC7IrqJ0qdGD+K9YI11oWUlj3mb4dnl50EFXkwGmmUFaFcAOGz
	 B3LXH5C/82av396Dmj7ySaU8UIyjpNN2Uy4rrOaMDCyE9opxY+tvIYIZVM0o4e3npN
	 N5vlF6GzLKjOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 35AE6C53BC7; Fri, 23 Oct 2026 18:47:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 222094] sched_setattr: bug in `ERRORS` section w.r.t.
 `attr.sched_flags contains a flag other than SCHED_FLAG_RESET_ON_FORK`
Date: Fri, 23 Oct 2026 18:47:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yaneurabeya@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222094-11311-UQpYJ7FgQM@https.bugzilla.kernel.org/>
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

--- Comment #2 from Enji Cooper (yaneurabeya@gmail.com) ---
Created attachment 311258
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311258&action=3Dedit
Patch

I've honestly never submitted a patch to the Linux mailing lists. There are=
 a
lot of hoops to jump through in order to make a contribution... I'll try, b=
ut
please bear with me (I'll probably get something wrong).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
