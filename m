Received: from mx1.buffet.re (mx1.buffet.re [51.83.41.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01D9388878
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.41.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632272; cv=none; b=KnOHnR3mUUZJJUYmIGhcwbmdL2z6xE5cYprXARatYsV14O33qU+kFI9KJWF0gstikOYemIc4apbtay695GFFGKzfxfHkiGE+2I1SrkIzAGD1vxk/NaVROFHV2LyzDDaZylwgNzvsCAc29Sh8X46NiKktwG92JS6BIYvAp9+IQJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632272; c=relaxed/simple;
	bh=ZjE55C+akY5gEr5ffKfUbj7mFLsRItBYOyHvoSGnYOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1kYy+fkUXzd+dous/zEomfgrz2YQ5WN/e0M+4GDy/J81lKhy7dW4WVdN7fojg0nyyXbqlK6qmALH7aMv/K4esAZMsU/+AiMpK/AHGsOK6ZcXDSLgLB9DN487aDH9c8rKmtiKwxaJ5u0Opmy8kyvo8M8JfwnT/VL8q6E/d2edTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re; spf=pass smtp.mailfrom=buffet.re; dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b=lovmNJ48; arc=none smtp.client-ip=51.83.41.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b="lovmNJ48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=buffet.re; s=mx1;
	t=1789631945; bh=ZjE55C+akY5gEr5ffKfUbj7mFLsRItBYOyHvoSGnYOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lovmNJ48ey9tkBYqM9O3XTq0odZuDWiUPCvyzIARk3s4OQUC/O38U8aRyChUBeBVn
	 DE1bH9qr5gWoa9Bc2tHNsvMZGL/erVyl4BAdaEg/UT7GkrXho/CLsQgylHoDC/hWlt
	 gdGyRtX62EBD3RymmqpFa+nQYik2EDYNd/v5yH5MGCBetTep8fjKn3qkBFFC+KqpIi
	 mf+nfH7ISkb9agirwuoEJv0zCy8toNUEX/4er8wSuXqPyAWydYg5yb6MtDrYj5UhRB
	 wjuiuyZbkh6E9D6W1J1xgpNH8DQEcQGvf90s5Bv3S9qG2/dV6/pYIcc67nsD7YILCP
	 Sc8QwabrBGU2w==
Received: from localhost.localdomain (unknown [10.0.1.3])
	by mx1.buffet.re (Postfix) with ESMTPSA id AED21126849;
	Thu, 17 Sep 2026 09:59:05 +0200 (CEST)
From: Matthieu Buffet <matthieu@buffet.re>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Matthieu Buffet <matthieu@buffet.re>
Subject: [PATCH 1/3] man/man2/landlock_add_rule.2: Clarify ephemeral port range
Date: Thu, 17 Sep 2026 09:58:50 +0200
Message-ID: <20260917075853.10231-2-matthieu@buffet.re>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917075853.10231-1-matthieu@buffet.re>
References: <20260917075853.10231-1-matthieu@buffet.re>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify that ephemeral port range can differ from system to system, and
that a compromised application can choose (without any randomness)
exactly which ephemeral port will be chosen next (as long as it is
within the kernel-wide ip_local_port_range)

Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
---
 man/man2/landlock_add_rule.2 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index fe01a98d99ea..633d89824373 100644
--- a/man/man2/landlock_add_rule.2
+++ b/man/man2/landlock_add_rule.2
@@ -109,9 +109,13 @@ is the network port in host endianness.
 It should be noted that port 0 passed to
 .BR bind (2)
 will bind to an available port from the ephemeral port range.
-This can be configured in the
+The range is configured globally in the
 .I /proc/sys/net/ipv4/ip_local_port_range
-sysctl (also used for IPv6).
+sysctl (also used for IPv6),
+and can be further restricted per-socket using
+.BR setsockopt (2)
+with
+.BR IP_LOCAL_PORT_RANGE (2const).
 .IP
 A Landlock rule with port 0
 and the
-- 
2.47.3

