Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AFC2EACF2
	for <linux-man@vger.kernel.org>; Wed,  8 Apr 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639917; cv=none; b=lkzUam/Hr6EfTjJaDmodKG4XtE8BBXLZJXtwf3lUiAUEcHOrczFz4rQYJY44cXDK/rQ33XcyhVUBtwhsX15OR0xoUFFHb7Y2qSWrzVcDJMTuEBUHdZclAGz3rJW3DDzLJSlhRw+m8XF/uYmlYhpDI5Y6xSewJ3xxhPjxmP/pVKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639917; c=relaxed/simple;
	bh=SAq5MIrOpJFPui2lUFiXVaN51nURTe1+VGaZ9DmQWvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUQLQPqTsmpAfjcqHIuPCddI99Gy74lrbec2RrA1LddjftH0UMP+yR2+KqQH5dKRbPg295wF+JYPV2rRMYqNF6XtUwGz9bWyEddZ0Vax6km9JhsYGow39MaQ1X6As032QNUT4RROIOpAgzSvelE0pXmbGeuPW6ZFyvtHWCx+6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/7akop4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/7akop4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97012C19421;
	Wed,  8 Apr 2026 09:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775639917;
	bh=SAq5MIrOpJFPui2lUFiXVaN51nURTe1+VGaZ9DmQWvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/7akop4epLg0rzugvil+WUoG+OyUThE4qAaC5C//2j/vpRNny3iY64giHx8y/9EH
	 taV8z8sIht3dPe81fAtYymyKtNxjkuznFJhYGIvwOM00umpXI2cNu+7UWr6THnsoQz
	 mtdgo18ASBdNc7GEJv6pVNDxi27a56OmtIkAmJ3pGWmmXVaqVmotul+3NnCco7AyM8
	 ZOb1TVHP2A1tyvDQGJaljhm0vdTd2OGzoCr2+q2OQoINXh0ywOY2Ldgt0y2dEJl1lA
	 KzTrrCkQ13T57+uZm5/HAZAZSWXXy4ph7FzUlKd1Za8PAPRuU0ThRJjKPArudhvEh7
	 zdt8M7RLbPTLA==
Date: Wed, 8 Apr 2026 11:18:33 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, Guillem Jover <guillem@debian.org>, 
	linux-aio@kvack.org
Subject: [PATCH v1 2/6] man/man2/io_setup.2: Update reference (proc(5) =>
 proc_sys_fs(5))
Message-ID: <978c3109c2e18e74f9edf23e0e966c7534e803b6.1775639353.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <cover.1775639353.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1775639353.git.alx@kernel.org>

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man2/io_setup.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/io_setup.2 b/man/man2/io_setup.2
index 43d9a631..f2fa4af8 100644
--- a/man/man2/io_setup.2
+++ b/man/man2/io_setup.2
@@ -61,7 +61,7 @@ .SH ERRORS
 as defined in
 .I /proc/sys/fs/aio\-max\-nr
 (see
-.BR proc (5)).
+.BR proc_sys_fs (5)).
 .TP
 .B EFAULT
 An invalid pointer is passed for
-- 
2.53.0

