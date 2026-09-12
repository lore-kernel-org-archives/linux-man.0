Received: from mta0.migadu.com (out-91.mta0.migadu.com [91.218.175.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D337F313
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212809; cv=none; b=ZdQAzaO7nZ0ISc26EY9sQuVQnpMyO0zb5dgf9VRabaRgX5CoTV4cmz5TgcNMZMxcs3fWhCidpX552KjtKJGd5bCiYAZVVO2jjGe5lywvI8l+e59bVX4rZ2ly0UcOBL2tll5mIboAQf+b6mE3Y8xQWUXL/rrkpJ7IF9a2Q57vR/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212809; c=relaxed/simple;
	bh=oR0UejmbDj+aQEQxVdwbB6i3YctbvT+XQtTVkVCHr5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3iEo/Cf3KhSMiLmfUrvbDV5mwxat+2XJ7C9KZVwsXf6Z4zT1JQMwmNg+PPwrdF99U2Bf++txw2nl+/P0Fjxrg+P5jzD1pYylMjm5HAK27qdCdxpDtJoDg7zLIXgdXTdHmwRLd7XihLKQecycKH/vO+uye45gz06gzHGpekkqUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca; spf=pass smtp.mailfrom=maxchernoff.ca; dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b=OjxsuGa1; arc=none smtp.client-ip=91.218.175.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b="OjxsuGa1"
X-Envelope-To: linux-man@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oR0UejmbDj+aQEQxVdwbB6i3YctbvT+XQtTVkVCHr5k=;
 c=simple/simple; d=maxchernoff.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789212805; v=1; x=1789817605;
 b=OjxsuGa1+z6HvNGccllevHMb4HLTADVrjewAqVp2y/Ysqg4D80oIJa0HIRIamEsFGn624hMt
 3XV6OUhhq5S+GHRg1KpkSzoOy2Kll/DfO/PbJqex1MC1PF/wkZM10pb19XXw57F/eaf1Okew5bF
 5MhV6+3kNj/fXuSzdGOaMyRA4fhFSR4YM77Bm4Oq7pdEp1RgE/9wKSubhF+/YAPQO/cNR3kIXAJ
 lOtBIMmE6Xb28OGsvyZ7/trjEdGtVdIgzyz+auZ/34sxgaBR1kty/5eb+E0fdaRjC2zDyM/+es1
 OPCRWSsEFURN55H5y4HKO8zCI81e7NqUKWsBDIH+4Gf7g==
X-Envelope-To: linux-man@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 45170bc1f8f28d0b;
	Sat, 12 Sep 2026 11:33:25 +0000
X-Mizu-Trace-ID: 45170bc1f8f28d0b
X-Migadu-Flow: FLOW_OUT
From: Max Chernoff <git@maxchernoff.ca>
To: Alejandro Colomar <alx@kernel.org>
Cc: Max Chernoff <git@maxchernoff.ca>,
	linux-man@vger.kernel.org
Subject: [PATCH 3/3] man/man7/capabilities.7: CAP_MAC_ADMIN allows setting undefined SELinux contexts
Date: Sat, 12 Sep 2026 05:32:13 -0600
Message-ID: <bed5f1b68369af7e6a5cd5ebae8eb8ecfa7ef441.1789212041.git.git@maxchernoff.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=git@maxchernoff.ca; h=from:subject:message-id; bh=oR0UejmbDj+aQEQxVdwbB6i3YctbvT+XQtTVkVCHr5k=; b=owGbwMvMwCXWf8WB5bZ2aR3jabUkhqylFs42nDMnH/745+LlQ/VCxxVnb82dsWX2DkdfHqvKk KPdx3zqO0pZGMS4GGTFFFliMlM4viY+O7RQS3sBzBxWJpAhDFycAjCR88sYGfq2n0z+9tZQ9YF8 8p99Li9Y6nhKInPiLgdektz0UjUzq4mR4X32M5EN7/KKGL8VXFzCvZrx/7Q9+zclXnt/XObwDre NM/kB
X-Developer-Key: i=git@maxchernoff.ca; a=openpgp; fpr=5C696408F561E6C2A12A2BA08FD44004DB2B757E
Content-Transfer-Encoding: 8bit

Link: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=12b29f34558b9b45a2c6eabd4f3c6be939a3980f>
Signed-off-by: Max Chernoff <git@maxchernoff.ca>
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

