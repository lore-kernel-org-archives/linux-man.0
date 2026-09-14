Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A203D9DC9
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386777; cv=none; b=hzsQQ6UTR8fBLnXIbrFP1eceDLq6t0SZf/XgkHYdY8iWSnZ4Iv5h+pWJV7snJ3b7pDYFu8+wJBMNoh/Rxl2iyDAWHeb8pzMJiD5yL8Hsvl5e4V7yPxPnDDv5wklQxjotIsk9vTA15Nq9WNy/twh/PqPfESBxe4xtfGSMjGi4AbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386777; c=relaxed/simple;
	bh=uJcR3e0X6DinQuujiu8gj7psQ/Z0g5+H+LZWf1kH+9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2JslFFHVMI8DlXcmfIKKyR0Ij359mIkaqNAuJDDZU676mM/wRmHW9dpxCn/8VvZ9qlGcCgsT5VYZDGLmL/nw3xCdWCyjWllePNBqcR/8mqumwx9kOgl/puZPIZQo4ZVuNvYGC+m5d8A3geTHe6lQbhxky4PaoRvNyDW+wczjxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca; spf=pass smtp.mailfrom=maxchernoff.ca; dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b=HCcMuycK; arc=none smtp.client-ip=91.218.175.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b="HCcMuycK"
X-Envelope-To: linux-man@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uJcR3e0X6DinQuujiu8gj7psQ/Z0g5+H+LZWf1kH+9o=;
 c=simple/simple; d=maxchernoff.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386773; v=1; x=1789991573;
 b=HCcMuycKWSzrkVenTAiwvPKeLtAn6r5zwOu6px7zDg2p/lcT8L+RDokZXJ8e/7NOK705UKfL
 Og4Gs8+AdHiYre2lIf5Dqoy9j17zXrH95FYE1t3r3h6ngVu+1IVtAeIwkboflOMVZ4yZc8rLq7t
 pRmxFHa8Wj6if7t7axbUbO115+YyZgdN/8KP4UDWix56w9ZgmJqcAyjgEUP7yr9lcEhk79+EpX9
 uErrp2GItrYdNdsgqkgJ2IM3BwwjoFMN/tZdjrvMkSSfI0D3qaWT/Iip7JKLaQ//GtHN70D1O/v
 dcvkSIKjgu9FnEed1ZT5ZqV8ghFvvByzNkWDEPCEBdFSw==
X-Envelope-To: linux-man@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68d49ce0f062168a;
	Mon, 14 Sep 2026 11:52:53 +0000
X-Mizu-Trace-ID: 68d49ce0f062168a
X-Migadu-Flow: FLOW_OUT
From: Max Chernoff <git@maxchernoff.ca>
To: Alejandro Colomar <alx@kernel.org>
Cc: Max Chernoff <git@maxchernoff.ca>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 4/4] man/man7/capabilities.7: CAP_MAC_ADMIN allows setting undefined SELinux contexts
Date: Mon, 14 Sep 2026 05:51:48 -0600
Message-ID: <95c29dda82ed6948f938a74528a9c840aedb925d.1789386106.git.git@maxchernoff.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789386106.git.git@maxchernoff.ca>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca> <cover.1789386106.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=git@maxchernoff.ca; h=from:subject:message-id; bh=uJcR3e0X6DinQuujiu8gj7psQ/Z0g5+H+LZWf1kH+9o=; b=kA0DAAoWj9RABNsrdX4ByyZiAGqn39TItXKpH0SQvZy4hOcC2Bb70w8J6FqXoHp71T/fdEVKn Ih1BAAWCgAdFiEEXGlkCPVh5sKhKiugj9RABNsrdX4FAmqn39QACgkQj9RABNsrdX6M5QEAlD7N PARPNxQVSLawGOOxAMVs8uRTK21YVsmsZrmKUgkBAJIztON4jO5dX2zyPmkJqAK+PJH7zNhX6lJ 1d1rXuJwD
X-Developer-Key: i=git@maxchernoff.ca; a=openpgp; fpr=5C696408F561E6C2A12A2BA08FD44004DB2B757E
Content-Transfer-Encoding: 8bit

Link: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=12b29f34558b9b45a2c6eabd4f3c6be939a3980f>
Signed-off-by: Max Chernoff <git@maxchernoff.ca>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
---
 man/man7/capabilities.7 | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/man/man7/capabilities.7 b/man/man7/capabilities.7
index bb8f6d9db433..8813ff81f0ea 100644
--- a/man/man7/capabilities.7
+++ b/man/man7/capabilities.7
@@ -210,8 +210,16 @@
 .BR FS_IOC_SETFLAGS (2const)).
 .TP
 .BR CAP_MAC_ADMIN " (since Linux 2.6.25)"
-Allow MAC configuration or state changes.
-Implemented for the Smack Linux Security Module (LSM).
+.RS
+.IP \[bu] 3
+.PD 0
+For the Smack Linux Security Module (LSM),
+allow MAC configuration or state changes;
+.IP \[bu]
+For the SELinux LSM,
+allow setting undefined security contexts on inodes (since Linux 2.6.27).
+.RE
+.PD
 .TP
 .BR CAP_MAC_OVERRIDE " (since Linux 2.6.25)"
 Override Mandatory Access Control (MAC).
-- 
2.55.0

