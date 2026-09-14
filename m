Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F34352F86
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386771; cv=none; b=dGiVNgZOmI2xapEJdTzUdcwhNWOipfBCbTSTSAf1sDdvf4Efk+4ka76XbQik1YNtI8wvJm6l1yimALm5ZlbGVIrAMhv0B8OohPgYv1NjJIAtpH+xg96HncSGMJwhyDoYhGYrLeN+y/SzFKYkvhJHIgPhB3g8a1I4vH5rP4WMemU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386771; c=relaxed/simple;
	bh=uetyB2z7/xvnaK6UgiZxR6bSbTOB8BSMNgs85UxBsNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOzDGzQsFDXCToDDxcT6R4ilZ8YzsRyamrO7rhFT0UxIKBNK+XRQ5FQuR0SsLYLqOQZrWShBcow0V7OCZtdWXoKKWLoUlNokYwybwIVb6+TsHgiHdkY/3JBFq/rZ6+yl40/r8eA5/uuLezdLUAs+vIbP7K+jCl57gdinrT74D+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca; spf=pass smtp.mailfrom=maxchernoff.ca; dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b=VIBBH6kZ; arc=none smtp.client-ip=91.218.175.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maxchernoff.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maxchernoff.ca header.i=@maxchernoff.ca header.b="VIBBH6kZ"
X-Envelope-To: linux-man@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uetyB2z7/xvnaK6UgiZxR6bSbTOB8BSMNgs85UxBsNw=;
 c=simple/simple; d=maxchernoff.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386766; v=1; x=1789991566;
 b=VIBBH6kZ3X08TQbCFrcuxbh9bkJxVwonuVW61pSTKqn8eJorZzEFuOgFDdYL1xXRkOf38F0y
 euE+gTHvZgnRHe243hUrSs5wSMkjBTVfgU2VB+irqbm04UVEyPvKMSaMsoZS6RGCkXT9rli0tiq
 e90VpCU0tjQolCQvtbjOjzxldOAZZK3qyaYP82IYLDoIQ7bscMiVS47B4/ywbgQFE7t4p5O6Hjf
 gynrSnvPiJhvba3N5GO/pw1SR3K2U5MDQmSE+hoS55hneyXvpF8aItHRzurw8GbfbJ8F33Nzojx
 VI1oOHHnYM8YgLCzAHvMHPezuO7MERaByZmXklbkArVHQ==
X-Envelope-To: linux-man@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0632077271bfe803;
	Mon, 14 Sep 2026 11:52:36 +0000
X-Mizu-Trace-ID: 0632077271bfe803
X-Migadu-Flow: FLOW_OUT
From: Max Chernoff <git@maxchernoff.ca>
To: Alejandro Colomar <alx@kernel.org>
Cc: Max Chernoff <git@maxchernoff.ca>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 0/4] /proc/pid/smaps_rollup + CAP_MAC_ADMIN
Date: Mon, 14 Sep 2026 05:51:44 -0600
Message-ID: <cover.1789386106.git.git@maxchernoff.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=git@maxchernoff.ca; h=from:subject:message-id; bh=uetyB2z7/xvnaK6UgiZxR6bSbTOB8BSMNgs85UxBsNw=; b=owGbwMvMwCXWf8WB5bZ2aR3jabUkhqzl9y8nqH/3j9i9lOXLnk21/Bf+R9d/mGXgdO1ZwLM3d 06X9/E3dZSyMIhxMciKKbLEZKZwfE18dmihlvYCmDmsTCBDGLg4BWAiSSWMDC+mKC+ZXvh5aZAZ 74lXs1gLw09PinRcxdB7fb/amzlFJ5wY/vswCepuzJC4qbRg19eH8lplTA47Wmw7/YK2ThH7sc7 Zhx0A
X-Developer-Key: i=git@maxchernoff.ca; a=openpgp; fpr=5C696408F561E6C2A12A2BA08FD44004DB2B757E
Content-Transfer-Encoding: 8bit

Thanks for the review; I've split the first commit into two, and quoted
the relevant lines from the long thread. The last two commits are both
unchanged, aside from being renumbered.

Max Chernoff (4):
  man/man5/proc_pid_smaps.5: Add description
  man/man5/proc_pid_smaps{,_rollup}.5: Add proc_pid_smaps_rollup(5)
  man/man5/proc_pid_{smaps,smaps_rollup,maps}.5,
    man/man7/capabilities.7: CAP_PERFMON allows reading
    /proc/pid/{smaps,smaps_rollup,maps}
  man/man7/capabilities.7: CAP_MAC_ADMIN allows setting undefined
    SELinux contexts

 man/man5/proc_pid_maps.5         |  5 ++++-
 man/man5/proc_pid_smaps.5        | 17 ++++++++++++++++-
 man/man5/proc_pid_smaps_rollup.5 |  1 +
 man/man7/capabilities.7          | 21 ++++++++++++++++++---
 4 files changed, 39 insertions(+), 5 deletions(-)
 create mode 100644 man/man5/proc_pid_smaps_rollup.5


base-commit: 59ba1c34fb6538206e96597739f053183d1e6428
-- 
2.55.0

