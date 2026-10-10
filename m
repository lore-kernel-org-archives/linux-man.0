Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563C93603F6
	for <linux-man@vger.kernel.org>; Sat, 10 Oct 2026 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655720; cv=none; b=h4GV251/PSOFopzzB0mts5rytCPgNs7PE13gQLZ+Jssc81Rii5SGvnwvTvNzjok26e87qgn5+wRT0bpYXeEUDQNI1fsjgBmfwF0oVnVKfAudUm70c4n5wOPdokPFXAaJQHiH5gnR+4hMQUFekIrLb7OIDzAVPKmmvuAbGXC6iSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655720; c=relaxed/simple;
	bh=Ipl38Hj9cD8BoMT+KoOttu/Fu4Ib1tVQzqP3M5syKHE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aKblP2wFeY1MGPC9K2EXW73SSV9LbyKNBQMQUWgMg+FiKWaIEGXnB7fJZs4w7X4TVYyJaINArL7mX6kwnCpCmfuOysSNtXSMInBsZzpDdcmlTrv9cMBHR0UL0vn3sz/8e6GoU3B9EQ5nSXYWECx0eAZXjoMaWnY4GZPCH5zMo2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1tZuPfN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1tZuPfN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F07E3C2BCC7
	for <linux-man@vger.kernel.org>; Sat, 10 Oct 2026 18:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791655720;
	bh=Ipl38Hj9cD8BoMT+KoOttu/Fu4Ib1tVQzqP3M5syKHE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T1tZuPfN571/rNZtZYy6Fm3mNIXZx5INQxwn8rFlStiHMRbCY3lgXBQz6CCEyVYmz
	 88VUVwzBY7pARaCamTo/k7+hu/cYvyQDkWIQxqGt7iLJhVKu+xPeKoo+eRcksxFarm
	 cCNBPzkSRQczDIMprSeE5vHe1s8mJNXT17iLg3YtS+B/bDuJcsGMDWDWhRh64RkYat
	 dt3VqI/u2dQTl/UnSVQOBK+3dpYFq7igudFmN5WAKNmjO17jYSvoqPoTzbYGGsVw94
	 Cmqv8PKlHbPAzHmz5SHP/eihhKfA3z0QM10+EXS9h/aVF5Cc0fwI62/QbkvE2WyJHP
	 p11g6emQTVH5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D4A41C433E1; Sat, 10 Oct 2026 18:08:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 222094] sched_setattr: bug in `ERRORS` section w.r.t.
 `attr.sched_flags contains a flag other than SCHED_FLAG_RESET_ON_FORK`
Date: Sat, 10 Oct 2026 18:08:39 +0000
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
Message-ID: <bug-222094-11311-xGXc6P7azu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222094-11311@https.bugzilla.kernel.org/>
References: <bug-222094-11311@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222094

--- Comment #1 from Alejandro Colomar (alx@kernel.org) ---
Hello,

> Date: 2026-10-05 15:31:25+0000
> From: bugzilla-daemon@kernel.org
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D222094
>=20
[...]
>=20
> Per https://www.man7.org/linux/man-pages/man2/sched_getattr.2.html:
>=20
> This scenario documented in the manpage implies that `attr.sched_flags` m=
ust
> be
> set to `SCHED_FLAG_RESET_ON_FORK`:
>=20
> >       EINVAL attr.sched_flags contains a flag other than
> >       SCHED_FLAG_RESET_ON_FORK.
>=20
> The second scenario implies that `attr.sched_flags` is a bitmask which can
> contain `SCHED_FLAG_UTIL_CLAMP_MIN` or `SCHED_FLAG_UTIL_CLAMP_MAX`:
>=20
> >       EINVAL attr.sched_flags contains SCHED_FLAG_UTIL_CLAMP_MIN or
> >       SCHED_FLAG_UTIL_CLAMP_MAX, and attr.sched_util_min or
> >       attr.sched_util_max are out of bounds.
>=20
> The first case contradicts the second case.
>=20
> Doing some digging in the kernel source code [1], I couldn't find an obvi=
ous
> spot where the first scenario was actually implemented -> **I think the
> `SCHED_FLAG_RESET_ON_FORK ` scenario is a documentation bug.**
>=20
> 1.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/k=
ernel/sched/syscalls.c?id=3D786244f70322e41c937e69f0f935bfd11a9611bf

Would you want to send a patch?  If so, please have a look at
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
IN>.


Have a lovely day!
Alex

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
