Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E9235C690
	for <linux-man@vger.kernel.org>; Tue, 25 Aug 2026 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649934; cv=none; b=jYaqvHPRS2rF0TLkKzPIWzRTECwf1qxsTDzbp1rcWEH3igZGNTWLnSaxSWgOSMDeZUzAgMCvbYDYaXRBODczrgz5Huf8jYVke9TmUA9C/2+o+D3ViiOlt7yWM4/Xyt+uQaxeHR9FnZOjU7egDowbV9qdcUqqtI917G05jbH4Bjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649934; c=relaxed/simple;
	bh=QDPWetbR8JpLus0Yc7MkH6ruFewJWv8cTm1EojSsLSg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gvYSXhzrSPui2ah1cWAZyrhgD5msIOHLKTeiEXLHqnTNy90kqBfX2nXiV6lnsQysdB0F4Az6fS9lqbP7kNBKD4nLcepgdyWvO1WM4LyOhqVK7LGz9NlQefIxpt5sZWi9fl5Xx1B0+Vwxiql5YTEHi8xqIb6zza2EAy386S5S1xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7lJBUUI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7lJBUUI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FA86C2BCF4
	for <linux-man@vger.kernel.org>; Tue, 25 Aug 2026 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787649934;
	bh=QDPWetbR8JpLus0Yc7MkH6ruFewJWv8cTm1EojSsLSg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c7lJBUUIyIHwrnHxGqs6yFNQSFcbcmxtMAi7K8ReAfKwY33sfSldxVDsfmYd4Z/+T
	 gmHjpIHx3i+N8kb4sI5YG4aTCAK+R5ZkTeHi4hTi2VHs/EXGkMoRKJOxy+o+PsAOR/
	 1BAmzgzLfvtlMzky9NRmXc+iKz63EwCJso7l2owG4B9hRz/Z1gdFfEkcyHgxlrsWq4
	 hFVkA9GvFLKoiDL3KA3iHx/bBgKecp9ZFlNFUYLrd9vK54LOkj5GCaqwGrTf5jfFU0
	 nr5yq9R3qb6Uqfq4CZt28xgz7HODZ+mF5UuR/75Cwqibtaa6jbmUbk+BLlCiQw5K20
	 dcJfrLYIFbbBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 16263C41612; Tue, 25 Aug 2026 09:25:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 218336] mount(2) doesn't document ENOSPC when
 /proc/sys/fs/mount-max is exceeded
Date: Tue, 25 Aug 2026 09:25:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@black-desk.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218336-11311-u651rkdbbW@https.bugzilla.kernel.org/>
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

Chen Linxuan (me@black-desk.cn) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |me@black-desk.cn

--- Comment #3 from Chen Linxuan (me@black-desk.cn) ---
https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=3Dcb=
399bd26e6ff11793fab1878c7991464f0f55c3

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
