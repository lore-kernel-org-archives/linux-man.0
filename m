Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B282C346A0C
	for <linux-man@vger.kernel.org>; Fri, 18 Sep 2026 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715088; cv=none; b=KeBbXQd2pAn7UkduAsF4riVMx1TKD/KXkC9PkjbCp/a0zF9n/M7wl07rsdtiZVLpkAzsKB++Pm9dn6jiq3+FT+MGZb0a2dUR5m9M7G1o/z9WQZ1+donT1sIFBvpF7BcStNoHUOjx3OpvHasCxFRhTK5/a24HLgnKL93yPKnjDGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715088; c=relaxed/simple;
	bh=n7nJMWleDfkmYJxRdeF8cnKjQA8bBWhKZYzaK/pCy34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPkwqxIMmOip2zqcQ46asZflYtT2Z+ar2K+Fr0SwobSsKQHJg16NSzVSgBr6K9ZGg9dr5sYTO3b2VzUdnNKWW35XiywvTNvkWvhnC0fPP2qOF/Kws8Kil0+MiV/lo8kASCr2RXWwXyW50UBdM2Tca6VhPqCvPJqcv83xxn0fnqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=FE2FloD8; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="FE2FloD8"
From: astian <astian@memeware.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789715072; bh=n7nJMWleDfkmYJxRdeF8cnKjQA8bBWhKZYzaK/pCy34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FE2FloD8izSy/FsM4hW1JSL5WC5AOLT7TZmMbLH3U6D7M8ROuLg1KYY8vAbVOQew/
	 BBfFFv3XA6M8z9oON096HOTJ81SNJa0eZIJoAbw4DmehIITcQYnYiUBoxpsPIeEzRS
	 KUJFYSs2aok6JK1k2tkoJe9F0Th1PpKUXLtoz23FUU8QW9Ha/ArUUWModTC5XuR4Bt
	 MHhEJYNfFJlUB5L7+kXUp9TjeDb1BvvVuv5KtmBJx5WJDDDAp2dfM9YvBxhLcFtysl
	 KZwJiq3LycIS7QJKGugCVirBUKT9bkQsIw0SnpXIZS6iKYFmofJ+Cq9kqH21FGGE3r
	 T1Yj4m7+Wg73w==
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man <linux-man@vger.kernel.org>,
	astian <astian@memeware.net>
Subject: [PATCH v2] man/man5/proc_ioports.5: wfix
Date: Fri, 18 Sep 2026 07:03:12 +0000
Message-ID: <20260918070346.1407544-1-astian@memeware.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917195829.1380868-1-astian@memeware.net>
References: <20260917195829.1380868-1-astian@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: astian <astian@memeware.net>
---
 man/man5/proc_ioports.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man5/proc_ioports.5 b/man/man5/proc_ioports.5
index 10d03f5aae7a..6729a7b98054 100644
--- a/man/man5/proc_ioports.5
+++ b/man/man5/proc_ioports.5
@@ -10,7 +10,7 @@ .SH NAME
 .SH DESCRIPTION
 .TP
 .I /proc/ioports
-This is a list of currently registered Input-Output port regions that
+This is a list of currently registered input/output port regions that
 are in use.
 .SH SEE ALSO
 .BR proc (5)
-- 
2.55.0

