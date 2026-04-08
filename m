Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30D2EACF2
	for <linux-man@vger.kernel.org>; Wed,  8 Apr 2026 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639926; cv=none; b=WqvgmZHP8IoX+8K4Lwb6NcW8n4BRDr9CXO0evkRoPUeh3TR0EQ+zFJAWOAJ9PiPki0L9Q1HbyJVJzEwSvdPjbknrsjbXqgI9+BcDGHAyW2XERjMCTGjmsZ435WjETeQfIzhZr03qU95gNEJHMF423d74QgMCHNK/Y4S20bDjato=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639926; c=relaxed/simple;
	bh=u9yvoz3L38vjsxih3ImOyc/2KrwvL1j+DSRUo2dkAKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0qyISyxi6vlyCMg+EY6IZz2TS59ykZijxRnB6pagSdaOtIi5rRqJh6tn3jvdy/nHz1WNQGdc4xj6Rv3bB0gYlNXDQzqe/Plr4Odyt39ATGYeGAqhL3AFUJsJDD1ufSPbdnhMJzrJI1FE7U5NRKLIG4cQAI3vVsZVsqP3g0AH04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBhVoK4U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBhVoK4U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E23AC19421;
	Wed,  8 Apr 2026 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775639926;
	bh=u9yvoz3L38vjsxih3ImOyc/2KrwvL1j+DSRUo2dkAKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBhVoK4U2lLd1G025E+M1botJoIdxMTyatJ7tHVf5e01k/pmXwPJEDlK3GNgJUAon
	 LlYMEwQ+q9y8wNTkVuSzWiR3T1DaQ/koGtF6ifx1qDWPx7nwUmIzouz6B8rov3IS+t
	 RoK4eLNDsGNQhQRxCuaKtCneyksULEGQrw3LIFVNohybg+MDJmYW4kM2nWjYjuRpc2
	 o+xHt6r5W4bd4wSIXvBBZYjzG/NcozOn+TvUZXsyUkOpVMN3QjAOnE9oAWJXIKaAsR
	 reJpait8x704hLDzH0z35/tPVGyDFibbbWjpD91eANKX6V3TLMrbXF2u5YxN5ECl8x
	 YgJMvMH+98zFA==
Date: Wed, 8 Apr 2026 11:18:42 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, Guillem Jover <guillem@debian.org>, 
	linux-aio@kvack.org
Subject: [PATCH v1 4/6] man/man2/io_setup.2: ERRORS: It is *ctx_idp that must
 be initialized
Message-ID: <31b6dec8ca48001e4c1f85e53646d06d9f543ee0.1775639353.git.alx@kernel.org>
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

Also, clarify that it must be initialized to 0.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man2/io_setup.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man/man2/io_setup.2 b/man/man2/io_setup.2
index 08e98e89..f2f59c61 100644
--- a/man/man2/io_setup.2
+++ b/man/man2/io_setup.2
@@ -68,8 +68,8 @@ .SH ERRORS
 .IR ctx_idp .
 .TP
 .B EINVAL
-.I ctx_idp
-is not initialized.
+.I *ctx_idp
+is not initialized to 0.
 .TP
 .B EINVAL
 The specified
-- 
2.53.0

