Received: from mail.smrk.net (mail.smrk.net [45.76.87.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC9442E007
	for <linux-man@vger.kernel.org>; Thu,  9 Jul 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.87.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612871; cv=none; b=HLkWTVfd4Z9ESK6w8fuCKgGvVIfpNCTicMJ22hYR1LZl/oMI7e7Sk8dPdorwiY+/vYhMroDK7cXtSZn4PFSeWUvWT7BHXdiSf/GuGVB9lElUw5aAIpT2+TKj3SQoSkySprPTCbmNY1u2N+OVcqGj4no5bzWZzMtcIh035X+eWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612871; c=relaxed/simple;
	bh=SmFqTIkpSKGPAWSTl0S3B7XXKpNUGpLO6u8TdxbRkqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfM48ZQwzwajciWX5VAqUdj3/J3/Yg0X2355I7ApzuLBL2CiLQh9A4T+YGoZ7P56ECWtipNl485PVo+xjziYXis/7dB8y8sujgOw3lfeES63Ep9RcQXIpMTwUiqGOWphqMbEdgjKcMfXtVl9JALqbM4Fv1hppObqvqgbdhuZGcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smrk.net; spf=pass smtp.mailfrom=smrk.net; dkim=pass (2048-bit key) header.d=smrk.net header.i=@smrk.net header.b=hYdH5y0Y; arc=none smtp.client-ip=45.76.87.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smrk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smrk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smrk.net header.i=@smrk.net header.b="hYdH5y0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smrk.net; s=20221002;
	t=1783611263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOYpdUxWrOOy16J064vfJB2kj+H/OCwjDNm6x2zgc1s=;
	b=hYdH5y0YDBhk9fHQAeoOn057QsEVvuTZ3Sx8ArKkMVcdE6Y6jM9IqyqGoHEZ9cuP8MNljF
	6ddVR+8LJFtMwxu8amKj0pJYIEDPMpLpHq5TkYJ4VWoQeUffzxWtYQEFC7xsZd9NGT9hue
	u7Ms+q6qPun2a907Mc1mWOz8eCpnv8ep7LGN07a5sVo6acbLj5snZPsLx/IsUGrjYkYdan
	5qLNpHhXkJOlG8Pf5QQqNkCLgYEMMrd6E51mjg2RwbzdzPuoqjsaGQxATsa9k9SqpOR88w
	mKB9ohCpLb4ZkL3DJ7jhidwnC5PsfqoALyiACw5NAVcZ4QQGjOEeB6qNa+er0Q==
Received: from localhost (<unknown> [192.168.5.2])
	by smrk (OpenSMTPD) with ESMTPSA id 4de5803d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 9 Jul 2026 17:34:23 +0200 (CEST)
From: =?UTF-8?q?=C5=A0t=C4=9Bp=C3=A1n=20N=C4=9Bmec?= <stepnem@smrk.net>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH 2/3] man/man7/pipe.7: Note kernel commit of the soft limit triggered cap increase
Date: Thu,  9 Jul 2026 17:34:21 +0200
Message-ID: <20260709153422.210312-2-stepnem@smrk.net>
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

7543e84442d7 did reference the kernel commit in its commit
message, but the convention to include it in the man page
source as well is helpful to wider audience.

Fixes: 7543e84442d7 ("pipe.7: Document change to default pipe size when soft limit is exceeded")
Signed-off-by: Štěpán Němec <stepnem@smrk.net>
---
 man/man7/pipe.7 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man/man7/pipe.7 b/man/man7/pipe.7
index 8641bcf4d807..d5744c2186b8 100644
--- a/man/man7/pipe.7
+++ b/man/man7/pipe.7
@@ -229,6 +229,7 @@ .SS /proc files
 So long as the total number of pages allocated to pipe buffers
 for this user is at this limit,
 individual pipes created by a user will be
+.\" commit 46c4c9d1beb7f5b4cec4dd90e7728720583ee348
 limited to two pages
 (one page before Linux 5.14),
 and attempts to increase a pipe's capacity will be denied.
-- 
2.55.0

