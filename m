Received: from mx1.buffet.re (mx1.buffet.re [51.83.41.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE93A7F6F
	for <linux-man@vger.kernel.org>; Sat,  9 May 2026 17:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.41.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778348248; cv=none; b=EzD7m+oGFcm+xZnbkQsavHZcmBEXS0fD8r9n5lDQYWHozSFu5+KhI7fvWQ7BKTVelVOdLBfZgdp+Sx9eHZIAQcax7rmuME5oVROyaoSQd0NHFrGB2pqziLdNACGst3u3RsL7QgKn5HrHZ0390FxLHpMgIyV2VOivCiJtvjjWD1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778348248; c=relaxed/simple;
	bh=x0kNTqRK3D1znKfE3Xrtr8yhJXwsRIAWIWkQIUsa3ZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eYqIDROb/VFAIGWaLLZmRWIyWt59PX3nPaOVhYm26ojx2u31SwpHCCyol6IFTlD+fgY3nE5D68CYMuPCktjVn64GlXFHVEt4sF+6lXw3Vy1orNAERzC5ai5T6P+z4LWJ4Ca+CeR1/6qC3PNQdILc7jePW3i405IZltNjesFKZME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re; spf=pass smtp.mailfrom=buffet.re; dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b=QFOVw/Xh; arc=none smtp.client-ip=51.83.41.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b="QFOVw/Xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=buffet.re; s=mx1;
	t=1778348237; bh=x0kNTqRK3D1znKfE3Xrtr8yhJXwsRIAWIWkQIUsa3ZU=;
	h=From:To:Cc:Subject:Date:From;
	b=QFOVw/XhijG3A1s7yUaDwhikmQEd2shCT+V5k0LsK62Fa+790gzM7gPuljq5yQlj+
	 r6WKiWDUwbsp6GT9jBKtOjK0I4FFAiUbxgONYH0wtunbd1jydiPmOss5nr8SAyNAUI
	 HJujWCCj2nC6dLN6IHbnkgtagkXj4Hb93hs+wFLgZRXlO/tjpq7SYfNeEY1Jmpxmtt
	 xlRLjhcSmIMmItRQZSgWHhZtsl3oLsRCYYFIpL0bO4sRDZJt4Cw6ZmYqellDS7Z5wX
	 QD+D5Bgf3U0gzMClXSdYdY7ZYxsrkJZSemTyZh9fqFZMzkl6+7pBrejovRfZE7B+gf
	 E24K4uoinNoVw==
Received: from localhost.localdomain (unknown [10.0.1.3])
	by mx1.buffet.re (Postfix) with ESMTPSA id CFD7C125508;
	Sat,  9 May 2026 19:37:17 +0200 (CEST)
From: Matthieu Buffet <matthieu@buffet.re>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Matthieu Buffet <matthieu@buffet.re>
Subject: [PATCH 0/1] man/man7/pid_namespaces.7: Fix process/namespace hierarchy restrictions
Date: Sat,  9 May 2026 19:37:10 +0200
Message-Id: <20260509173711.1920769-1-matthieu@buffet.re>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alejandro,

I just found this small inconsistency in the description of where a
process can be forked (direct child PID namespace -> any descendant PID
namespace).

While fixing it, I noticed the logical implication between the
restriction and the paragraph before did not make much sense to me, so I
pulled the explanation from the comment in the pidns_install() function
in kernel/pid_namespace.c. Let me know if I mixed anything up!

Have a nice day,

Matthieu Buffet (1):
  man/man7/pid_namespaces.7: Fix process/namespace hierarchy
    restrictions

 man/man7/pid_namespaces.7 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)


base-commit: 0cdcaf9d0d1f1c60f143364c5664f2c2e42fad1c
-- 
2.47.3

