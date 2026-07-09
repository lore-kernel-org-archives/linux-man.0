Received: from mail.smrk.net (mail.smrk.net [45.76.87.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46038AC83
	for <linux-man@vger.kernel.org>; Thu,  9 Jul 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.87.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612871; cv=none; b=ktbcKLcIoVRfV2kQebMnHwQV7HcjPfwZVUK34K5zsrdU765vsS2UfCUKQ559nNwo6IMRaCXB5momuHDYK6/56AfHVS2cM+cuRd6drLTGDJAhcUhFe1TUJ6CPLa0pzBMaqAQ1dDD4TyH3AE3jYVFBKcwBlFLk8Dc+uyHnxSCCAcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612871; c=relaxed/simple;
	bh=d009xvl+NK3LvRLuP5tZx+ItfF/76fJKmcDePRMd2TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bE0WDxOwGRScOVjxLYSRHpD0xw+h/v3472V5KoY1lVqc20jFSfkL2jS/P3HTf7n9LB4X0imoqLM5QilJT8lMCIyUbpn5+0FygEef+7esbPA0nixOeUKckzWTiGH+3bKm2fRjne7IsZVffcGBGT7sUeFZjWRAoVBm0WYFS7uQtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smrk.net; spf=pass smtp.mailfrom=smrk.net; dkim=pass (2048-bit key) header.d=smrk.net header.i=@smrk.net header.b=d3VLox5X; arc=none smtp.client-ip=45.76.87.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smrk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smrk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smrk.net header.i=@smrk.net header.b="d3VLox5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smrk.net; s=20221002;
	t=1783611263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J4pz9Tr0gRHcr+r9uU3FMHAa9s2ZfGzviI6yP2CnZcI=;
	b=d3VLox5XKuWTHIvGlT65N1TMlIoUDSlS3n86P38uWWPwoK5y6gW9pxwzyJxl0XBVd9lqt5
	uT3jZEUsj2pXBa1a32CtIMLfbWgnpTUy/tvl+NmdfQ4fwsPGTuvIju6hZvgqXu5WmH60FU
	oaGhOKPKav2p3gpx1KgXgrxsYF8qPGUEaAi3AnFu/eo9UF6KZ8TV1bC2BuHtUxhlsD3QEp
	1C6adWv5EtBYb6Yjc3xi4Gq+z5zWwQl7EDl3CcJQr5kRJgFN87azOa7GTQhixQiXXdTqp0
	LFi0nAqb41TbTyr1kjWgZiHnERGIz/mrmPc9L5KFlcc/Pz9cT5s8O9InjaOPZQ==
Received: from localhost (<unknown> [192.168.5.2])
	by smrk (OpenSMTPD) with ESMTPSA id 6ccf0875 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 9 Jul 2026 17:34:23 +0200 (CEST)
From: =?UTF-8?q?=C5=A0t=C4=9Bp=C3=A1n=20N=C4=9Bmec?= <stepnem@smrk.net>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH 3/3] man/man7/landlock.7: wfix
Date: Thu,  9 Jul 2026 17:34:22 +0200
Message-ID: <20260709153422.210312-3-stepnem@smrk.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709153422.210312-1-stepnem@smrk.net>
References: <20260709153422.210312-1-stepnem@smrk.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Štěpán Němec <stepnem@smrk.net>
---
 man/man7/landlock.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
index 293374ed9b46..556b08fff04b 100644
--- a/man/man7/landlock.7
+++ b/man/man7/landlock.7
@@ -296,8 +296,8 @@ .SS Scope flags
 .SS Layers of file path access rights
 Each time a thread enforces a ruleset on itself,
 it updates its Landlock domain with a new layer of policy.
-Indeed, this complementary policy is composed with the
-potentially other rulesets already restricting this thread.
+Indeed, this complementary policy is composed with any
+other rulesets already restricting this thread.
 A sandboxed thread can then safely add more constraints to itself with a
 new enforced ruleset.
 .P
-- 
2.55.0

