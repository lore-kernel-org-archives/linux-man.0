Received: from mta0.migadu.com (out-86.mta0.migadu.com [91.218.175.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC9332610
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212798; cv=none; b=ctaJv2e4CII+vD5WCuz9gvZoUGrdTsmxv0M3AXM+UC+4mW6BLZdH8k2a02A5G+hhlv1bkAs+tc1tzxkIMdCSjgwDHrPEc2kyjFyIMYAGsUInlObpSPuJvqFdwNQUaG6fxMmXOw/sc/3cDU2Z9ZsYHWpyyTEZ4wEK+LUAJUSir5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212798; c=relaxed/simple;
	bh=ZM0zDm6o4x3m4GQsMHQTy/bFcD4RAh+U+0/zJKq3D+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SznzP4lz7qkuWR37iB8kW9H6uEO0OvdQcDA2nbCEpAxZhJt5HMkUQFx+PYBU90TeKkoPWksaN/u7qe0R8dzIEeU9Q2Ito7QDKoYDJDJUFoH5l3szRIFxA9niDxnv3DNQoSEzDMVZfzotET1932Q/0Rwabg8vflF98quDqs+9WmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca; spf=pass smtp.mailfrom=maxchernoff.ca; dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b=TNI4+MB4; arc=none smtp.client-ip=91.218.175.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b="TNI4+MB4"
X-Envelope-To: linux-man@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZM0zDm6o4x3m4GQsMHQTy/bFcD4RAh+U+0/zJKq3D+E=;
 c=simple/simple; d=maxchernoff.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789212793; v=1; x=1789817593;
 b=TNI4+MB4IIlu6o3MXGfG4N7ROsr6kUS7xMYg6eFPcNLVfOmGYEFi3qLMn1faVE/YSul4ZPRY
 Uhry7cxAcZQIFSwuRlORRK1DfEMNgzwz7QG5kfnh7sbtoG2ebcJueQfXv4v8lL5AW5knw8aqidx
 sPikmoi40PQXij2Awt1RBLsCCiv0IGmIe7uveKYACa2akmJ+qTBEvzPR8kL4S9bJI28Sd1bAwBw
 XwqFyIIVXAM6NeST2Ojr+THTbkYDLyTnwXLnA+EikNNR6OSI7weBY5Dc/RSiemtyha+YPqXYOIE
 VC/9fFqsPUEr51fPnqJ9FmlbwGfjE7xW+kAlSFrZ84Ttw==
X-Envelope-To: linux-man@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 869ff565bcd97534;
	Sat, 12 Sep 2026 11:33:03 +0000
X-Mizu-Trace-ID: 869ff565bcd97534
X-Migadu-Flow: FLOW_OUT
From: Max Chernoff <git@maxchernoff.ca>
To: Alejandro Colomar <alx@kernel.org>
Cc: Max Chernoff <git@maxchernoff.ca>,
	linux-man@vger.kernel.org
Subject: [PATCH 1/3] man/man5/proc_pid_smaps{,_rollup}.5: Add proc_pid_smaps_rollup(5)
Date: Sat, 12 Sep 2026 05:32:11 -0600
Message-ID: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=git@maxchernoff.ca; h=from:subject:message-id; bh=ZM0zDm6o4x3m4GQsMHQTy/bFcD4RAh+U+0/zJKq3D+E=; b=owGbwMvMwCXWf8WB5bZ2aR3jabUkhqylFs4XSmQfbwpJluI9EctcL5qmxNggPEdR3W51R88x4 7U9hSodpSwMYlwMsmKKLDGZKRxfE58dWqilvQBmDisTyBAGLk4BmMiWIEaGhwbMWvsezVWqYFPb uWRRwU1O3cpC3j+/r2+46DJrE0OPOyNDk12xrvSZardtAkprAw/1ch3evFO1snL9xmNOE6bceur CBwA=
X-Developer-Key: i=git@maxchernoff.ca; a=openpgp; fpr=5C696408F561E6C2A12A2BA08FD44004DB2B757E
Content-Transfer-Encoding: 8bit

Document /proc/pid/smaps_rollup, which is similar to /proc/pid/smaps,
except it merges all mappings are merged into a single synthetic
entry [1].

Also, add a better description to the NAME, following the discussion
in [2].

Link [1]: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=493b0e9d945fa9dfe96be93ae41b4ca4b6fdb317>
Link [2]: <https://lore.kernel.org/lkml/3f250c7105010613115554b9d9@mail.gmail.com>
Signed-off-by: Max Chernoff <git@maxchernoff.ca>
---
 man/man5/proc_pid_smaps.5        | 7 ++++++-
 man/man5/proc_pid_smaps_rollup.5 | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 man/man5/proc_pid_smaps_rollup.5

diff --git a/man/man5/proc_pid_smaps.5 b/man/man5/proc_pid_smaps.5
index 9c433dbc1e60..51440cc13bf6 100644
--- a/man/man5/proc_pid_smaps.5
+++ b/man/man5/proc_pid_smaps.5
@@ -7,7 +7,7 @@
 .\"
 .TH proc_pid_smaps 5 (date) "Linux man-pages (unreleased)"
 .SH NAME
-/proc/pid/smaps \- XXX: What does 's' in "smaps" stand for?
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

base-commit: 59ba1c34fb6538206e96597739f053183d1e6428
-- 
2.55.0

