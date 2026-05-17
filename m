Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5E630EF84
	for <linux-man@vger.kernel.org>; Sun, 17 May 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003378; cv=none; b=sfxXNz014sXcafULEK+pDVL4mpHDDkp2zC6SV+UM8YmRTd4iLQURTdt4EB4Flqn7/VczKyvpFQRbPI+y5g9E5P/vt+1a7DSAN5sf73FgzlByanuKjD9bBupB0mA6VUvsFxOw5mW6C369q0WYaObwMUk38mbx4JgnN+LhFzJWce4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003378; c=relaxed/simple;
	bh=Y2S+Ul1EwDhWjL8niEmw9kryxi/4rBslxxMkEGia264=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EjASLABad988jbDaZhTzNpyfYMPJgrKj4OXmBI5M8Rf5TZsstEF2827btakNxiiJYlimK+67MhibLXkf1raO+ZSCd3SLgrZgXsNNZ8+LfRKhV63qxSHWEzxQWwp/bJNeGuIyBkY5OFD0DGxCSET3fmFVUqbHOn9+li4TDXUOzc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJNvvCYQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJNvvCYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E0EAC2BCF5
	for <linux-man@vger.kernel.org>; Sun, 17 May 2026 07:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779003378;
	bh=Y2S+Ul1EwDhWjL8niEmw9kryxi/4rBslxxMkEGia264=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mJNvvCYQoUnSKatFqDpnyeHoZECf9KcGyxMiFBuwSdWW9TN/hV7JNYJuzZ7I9sQdf
	 ZQQVwlOJQCQoqHDZH4NtHZPNUpg7Fc10JUH9HXLgJM4adbb/5iQz2GmlIFDJ/N6qmU
	 PMIonHzYZm/RlLoKWr3L0DK+oIxH6kiR8ErKXpmTpZqEGHwTG3DEi1L3m2cGXOtg3p
	 jrLMVJHjjwiRQsLKyiRmInYhCqB8aExl4JqWuHz33bAeSiXfozyldyZ1v0QV/Wctvq
	 bR6vTTjDloAyFVQby6jUIDolMHy4fSHQpDRfGMWA2CEexOHI7t9Q05UGtoyRiIPsxV
	 BlJ1GmU4OvolQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 33FDBC53BC5; Sun, 17 May 2026 07:36:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 221533] strstr/c23/constness
Date: Sun, 17 May 2026 07:36:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221533-11311-KhaUP5vA39@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
