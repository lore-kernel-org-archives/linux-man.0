Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792783675;
	b=M867k9LMlhpqLiaFNZVCwz+NIjmB63h/fYXeplxkzDUqMe5kRMuvLbXtYRIpujM8Cz1Q
	 VZs74cwfW45r6H9xOX2fRfSkZ2GMnwPyAdG4O+l2IG0YAXxspPMQjHcmUztSDiu+I90ZE
	 0vL9udBGpExL09zzencFGrLLEGvbRS37KwfFnEs6kj8K/n+GwzBuhNv71rutDPL0le9h8
	 qNg4S/Fcoio4TGWZoFmCio5rdC455cpyDOOtRlC2Ml++oiIVcxe2WET7q4wQVOiNUA5Xr
	 zeinDnbk3Er1vV5E6eTmaLR2XDEbWVt4KW3RvrNgeH7hKJuTV7dA2o5SL1Lm6O6Luig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783675;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=DuxV/pFF+E21GVL6TCGTkthwcmBlRzElV5jVLtgQQ1I=;
	b=iiAbmPYILlSpgU9uD1hCg4EwA1OWjPPQ+saeMuXbDJq9GR4idmJWjJOOxS+XchPgfL3k
	 IVTu2uvYFRwGfuiuicWmN0XEW+dbTjc/yRs/ovI1cDKx8pi3RZYsLW8rLpXnv5/WXcN04
	 0LjDQxD4VHhY2W8IBPcY21ZcAtFlg4n7MDCMVZyJ6UxI0v11Ghvs3aVyBV3DWmDTBEnBr
	 W2IyYy7bNVoEJzK6SGvyByih31weEr3O4wWgFddCPq+X0V/QFm8D8gUoW6LdGSxkRJ5E8
	 xz1+FYPPTV13Cf7nsveUw3O6IHj6ZXYrxfnFkvD/HgdH65+n8SNCPwZvp9+icWO9IPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=itb5wcPy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0122C606A31D
	for <linux-man.vger.kernel.org@localhost.mlmmj>; Fri, 23 Oct 2026 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=itb5wcPy
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A556513C0
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792783674; cv=none; b=D0UFObPl0jhF3goynSRl/hh5ToCRAZ6S9Kgn1gSIeSPlXEEp9FrxrjZvchVLZFeCnzKuv+nTOYls5KG+M9yqIzspW4KAC1maE4FBzztPkJYRe48ymAaU+CfJhO8vZ1F94W1aGbqSGqHXVtlJsohYDu56fcvTfoKG8ElXCaI7p1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792783674; c=relaxed/simple;
	bh=rSY9+nWuXD0Td+AHnXkYSiwWwDEP/iKFYT15A0joF2w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QSaOz3AsV3srcA1waHUSgXR0i5qRYdCzjMeKLv53IQ2Yd4mKKRDkQRCjHrbrYMy3QBUN00E/HxWguk34mkz8nY+9HCnL1ATmZcz7Ie8KqKZ932pfGfoa2XtnOIxBDpXFKbbhBuWu/ERSLUiG8K/wsDkjMZd0y0RiGQf5zBDN6wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itb5wcPy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4251C2BCC7
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 19:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792783674;
	bh=rSY9+nWuXD0Td+AHnXkYSiwWwDEP/iKFYT15A0joF2w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=itb5wcPyfvlA+uZ60qQx/cBhhicWhun6CPNLzEMkw51acEGBPXmC5KOQznU9H9MY2
	 lr+QA4hzZh7xArV5nKpfvNRZBbjMxlYuY+8nFzNVf/DzAnkeMqqqiG/X0t2WvhjphV
	 CayiJItWebNpusjB524G/w61R14ts2zu9zTBF2kiCQYN2AuBfsto2iGDsOjE2Z5pLV
	 GfFIiORQPExj5QnvMT1A6kgxLxT9V7H3t87SkQl8E6Wnovcm/MWo3cemrozSUb3QbM
	 NZjmANyW+FnQZI+nL3Gcp4Axg5BPIWjW2pUs+iumhpnn0Jqi2eG+MS6OC0IDkNLNGt
	 03PgaY9jh9yOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9404EC53BC5; Fri, 23 Oct 2026 19:27:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 222094] sched_setattr: bug in `ERRORS` section w.r.t.
 `attr.sched_flags contains a flag other than SCHED_FLAG_RESET_ON_FORK`
Date: Fri, 23 Oct 2026 19:27:54 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222094-11311-4TyrfjdLFq@https.bugzilla.kernel.org/>
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

--- Comment #4 from Alejandro Colomar (alx@kernel.org) ---
Created attachment 311260
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311260&action=3Dedit
signature.asc

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
