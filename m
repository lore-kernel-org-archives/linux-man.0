Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309553A6EFB
	for <linux-man@vger.kernel.org>; Wed,  8 Apr 2026 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639922; cv=none; b=aZ7F8+tnv0Xppdhvnhuwhd7sYYIVvBzjZKilBIkZKneKowmtH0ugbhsawoulxebs7az4kbKvzdErDOVJGrxtGJ1s4Mf5RHKG81zdhtTdlq9+Up7nPdy8fkSAUl0Zk4rSz7X/BdSWynxUpgDoeozpAdFHR4BC6RdqT25DUU5w5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639922; c=relaxed/simple;
	bh=loJutbnv4eSlTEalizvE1H41OymQcpU5jfU+rMPVnHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKp7xwFbQNA38KvzAHJXHdTWXYFNEFAqYETrSoBUu8ApqtcHkgSW7JJst3kHUgJjpYTPKs25iTWDl24u4ux0SgyOybKyAOTr5nKzvIRwxRHyM1GNXBG0aqjduRCyWb7Qn481pV6A8e9DED7xGq51DV82wRp7K8yI9h4tU5p/amU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NemO71Hr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NemO71Hr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35536C19421;
	Wed,  8 Apr 2026 09:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775639921;
	bh=loJutbnv4eSlTEalizvE1H41OymQcpU5jfU+rMPVnHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NemO71Hr7w7LCGkJZTwC2EQeJn+tPLfwHHY5SHbRaQyGgqc3FmN+akPc3J66XT4Zh
	 Z8JzQI8p2C7uKG1P6F/nPEVimRfOYPZnm/rDzk0YNN6XdByJwsdoaVvd2lbGWrjTU2
	 Jk7KLRtv+bVZzzbf29jMt7C4Rkhhh//vbhs3NrXJStPoJOiQyWbz+zXcjJLu21RgQ4
	 VpTWI7Svzkoi0ZrnE5wcRVVEeu/0Xoo8LIMaWsppLBCYCxrmTqjT6EliD1hqW8SNTj
	 fPa4/wj1wCZ08Kh3RMSKVUO0+IkipTL+LPcUuC/LEqfG8aQTh3+oqt4p6uu1/hpcoT
	 eI6VpldT3bbDA==
Date: Wed, 8 Apr 2026 11:18:37 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, Guillem Jover <guillem@debian.org>, 
	linux-aio@kvack.org
Subject: [PATCH v1 3/6] man/man2/io_setup.2: ERRORS: Split EINVAL
Message-ID: <28e8dc04075682029a0793211aac4f6ef9cd0b12.1775639353.git.alx@kernel.org>
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
 man/man2/io_setup.2 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man/man2/io_setup.2 b/man/man2/io_setup.2
index f2fa4af8..08e98e89 100644
--- a/man/man2/io_setup.2
+++ b/man/man2/io_setup.2
@@ -69,8 +69,10 @@ .SH ERRORS
 .TP
 .B EINVAL
 .I ctx_idp
-is not initialized,
-or the specified
+is not initialized.
+.TP
+.B EINVAL
+The specified
 .I n
 exceeds internal limits.
 .I n
-- 
2.53.0

