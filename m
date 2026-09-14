Received: from mta0.migadu.com (out-16.mta0.migadu.com [91.218.175.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAC644213B
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386770; cv=none; b=IqKmmsM6pcbFZ3gbgAYgyanPqtTTuXGVhT+cj3UPY0jfnQZIdoKjJpdVz6BaIvgBrzdBo4WeppDpa7RvYv/vad/tEotqRseSXQmUm3Y1d/+/0nPlToPTGCP6SHqtlKXM/UdwJWcdVGmsMwB0xlYoN5npM0jd8dOXLZXAPiZQLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386770; c=relaxed/simple;
	bh=nvmrQdxgapmb42T/HUG8SAlpIQA3Wo4UAquE+nZrALs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0EaYNvbOxYRMm47EocC06/6cbljpBJqZd0gbvvyjjl7KNPwpIrM3WW2p7ZqJXJLgfgC/ErMmrVV0Wph7LKMAQNMw1psIUiCnfvZ8Lz9CMpBhG+TM2IEcy93KYMVgnRNtX1poLyTGQ//91kQXK1/rh+EMalak5Ne5+1qQv2xiek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca; spf=pass smtp.mailfrom=maxchernoff.ca; dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b=xIuU6yyS; arc=none smtp.client-ip=91.218.175.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b="xIuU6yyS"
X-Envelope-To: linux-man@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nvmrQdxgapmb42T/HUG8SAlpIQA3Wo4UAquE+nZrALs=;
 c=simple/simple; d=maxchernoff.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386766; v=1; x=1789991566;
 b=xIuU6yyS0aoOYOuuPWLdNJNZY9rikGwyKxMF38su+PT/biSuSlePmTA03/2mmdUfxvK6Ik3c
 l+B6cS2sonuEBa7xcrIvU2rNoomj7HwE2+sHrAjV/lMYN2tp2cYUGI33xqLZXMtExTOBAGPcHS5
 isy5rD4yNXxyCq2T/H1YKF/oTW1n8OV1JNgIDE8fGryznaxAfMN2Yvsy7/NWWTCNHLAvjv7eqe7
 cTZuq9oPZoK4675wGoWvhLazjThQWVKO5ieC2ksgDMbDPTszMW4LB6QN5xt6CLs7gMOCeS1/f5f
 g68Z6HfduPKjSpXFCsoGQ69S5vH3okdJVE41CPPEVDHXw==
X-Envelope-To: linux-man@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 275958144945284d;
	Mon, 14 Sep 2026 11:52:46 +0000
X-Mizu-Trace-ID: 275958144945284d
X-Migadu-Flow: FLOW_OUT
From: Max Chernoff <git@maxchernoff.ca>
To: Alejandro Colomar <alx@kernel.org>
Cc: Max Chernoff <git@maxchernoff.ca>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 2/4] man/man5/proc_pid_smaps{,_rollup}.5: Add proc_pid_smaps_rollup(5)
Date: Mon, 14 Sep 2026 05:51:46 -0600
Message-ID: <ddd2b68e220607cf6047e5ccff1d40702eefa47a.1789386106.git.git@maxchernoff.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789386106.git.git@maxchernoff.ca>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca> <cover.1789386106.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423; i=git@maxchernoff.ca; h=from:subject:message-id; bh=nvmrQdxgapmb42T/HUG8SAlpIQA3Wo4UAquE+nZrALs=; b=owGbwMvMwCXWf8WB5bZ2aR3jabUkhqzl96+cv/X2x8ogu23sFZsq0x4b7hP/u/b0ufVnGeazt fBmHTDZ3VHKwiDGxSArpsgSk5nC8TXx2aGFWtoLYOawMoEMYeDiFICJuEQz/DOfNSmuZMmbDBlR kdldS7L73U2Ybyj7ZUW6i16xnnpNtIyRYdauRbfdPeyrcxNb1wlcXePD2qm9KS9aeolT6K6qFit HHgA=
X-Developer-Key: i=git@maxchernoff.ca; a=openpgp; fpr=5C696408F561E6C2A12A2BA08FD44004DB2B757E
Content-Transfer-Encoding: 8bit

Link: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=493b0e9d945fa9dfe96be93ae41b4ca4b6fdb317>
Signed-off-by: Max Chernoff <git@maxchernoff.ca>
---
 man/man5/proc_pid_smaps.5        | 7 ++++++-
 man/man5/proc_pid_smaps_rollup.5 | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 man/man5/proc_pid_smaps_rollup.5

diff --git a/man/man5/proc_pid_smaps.5 b/man/man5/proc_pid_smaps.5
index 963136109ad8..51440cc13bf6 100644
--- a/man/man5/proc_pid_smaps.5
+++ b/man/man5/proc_pid_smaps.5
@@ -7,7 +7,7 @@
 .\"
 .TH proc_pid_smaps 5 (date) "Linux man-pages (unreleased)"
 .SH NAME
-/proc/pid/smaps \- size of mapped memory regions
+/proc/pid/smaps, /proc/pid/smaps_rollup \- size of mapped memory regions
 .SH DESCRIPTION
 .TP
 .IR /proc/ pid /smaps " (since Linux 2.6.14)"
@@ -125,5 +125,10 @@
 file is present only if the
 .B CONFIG_PROC_PAGE_MONITOR
 kernel configuration option is enabled.
+.TP
+.IR /proc/ pid /smaps_rollup " (since Linux 4.14)"
+This file is similar to
+.IR /proc/ pid /smaps ,
+except all mappings are merged into a single synthetic entry.
 .SH SEE ALSO
 .BR proc (5)
diff --git a/man/man5/proc_pid_smaps_rollup.5 b/man/man5/proc_pid_smaps_rollup.5
new file mode 100644
index 000000000000..4b5f9eba0484
--- /dev/null
+++ b/man/man5/proc_pid_smaps_rollup.5
@@ -0,0 +1 @@
+.so man5/proc_pid_smaps.5
-- 
2.55.0

