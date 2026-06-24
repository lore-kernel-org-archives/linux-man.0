Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4227AC48
	for <linux-man@vger.kernel.org>; Wed, 24 Jun 2026 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296697; cv=none; b=AnmgVbT5V4Y8f8Untk/zaXyecu+HMeP+zAo1m4eVkoIO1JvDGcT1IBZIyPNlBYKNBtXaMc82iGvH50FIPkUlaixT4DPf9FAismUisyx3rkI4mX5OsB9Eju12V3PD+tQzElnqdbGCTZ7BY2cj+a2z5gyYVfjUsDGYKLeaMBQm+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296697; c=relaxed/simple;
	bh=Ox7XN01lbwAnRb9joGZ2eSysaupL7NvDBHiGTkG0kc4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=I1HQIK54NPVziLdzSD+hO/W5Kud/7RkesTqFwY5qygbCZKKPV8kaDQNA5Qe0biCM8OYooyFYP/c4eT15vcqPpqvCC/SStryl/DJ4riEKf+OiKRKZ91Oicv6Omxzjqlyr5cbqeSx+4O2bxRlXC28KdTjGj0JN5N500OTrCw7i3YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OickeiPR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OickeiPR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67467C2BCC6
	for <linux-man@vger.kernel.org>; Wed, 24 Jun 2026 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782296697;
	bh=Ox7XN01lbwAnRb9joGZ2eSysaupL7NvDBHiGTkG0kc4=;
	h=From:To:Subject:Date:From;
	b=OickeiPR/6TqPdjfw/b6V8SiT5lR8ZjJbLNrbIwspex6bO8ACcg++b/L+ClxNBjOA
	 jGK+qRx98LIFL5L0oK32sTJc7N5D4eJ34M7afU9vJTIHyxbZv/sz20FZlvhXAC+xfS
	 N1RFVUs1trGyLNI0B7sT4sS+s7kF020SysEuifE8ub0SRzcTFVWm3THLwfr2D1i0GS
	 kecDCWcC3i4jwiWfCIVPxQmZTAFNzff9uB+mFbbGqjsB3mrT4gj5YxXjaEUt0rQzKO
	 GbvUl5OP8fzO+bUKfL/X6JCgagoGhseD1zTonlKvthYPrYxY7oNN5TSkuqvja8xm/8
	 kkaks0EeJrVXA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4592BC53BC5; Wed, 24 Jun 2026 10:24:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-man@vger.kernel.org
Subject: [Bug 221686] New: README.d/ is not mentioned in README
Date: Wed, 24 Jun 2026 10:24:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo
 documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Product: Documentation
X-Bugzilla-Component: man-pages
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: jason@jasonyundt.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: documentation_man-pages@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221686-11311@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221686

            Bug ID: 221686
           Summary: README.d/ is not mentioned in README
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: man-pages
          Assignee: documentation_man-pages@kernel-bugs.osdl.org
          Reporter: jason@jasonyundt.email
        Regression: No

The README file for the Linux man-pages project has a section named =E2=80=
=9CFiles=E2=80=9D
that lists a bunch of different files and directories and describes them. T=
he
=E2=80=9CFiles=E2=80=9D section mentions the CONTRIBUTING file, the CONTRIB=
UTING.d/ directory
and the README file, but it does not mention the README.d/ directory. It wo=
uld
be better if the README mentioned the README.d/ directory.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
