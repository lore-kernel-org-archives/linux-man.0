Received: from mx1.buffet.re (mx1.buffet.re [51.83.41.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033F3A257C
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.41.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632271; cv=none; b=fSZ+IHUifYSVxwT8xvwr+ZGvpZBeQ9U/tCFlbQ9v+wmrDGq/OiZH+wpBfXE5IrD0wCh/aZJfBn1cWy6rakGbeSsviNNBsBocpRED0BUnWFp7oAiPXRpwiqekdAhJZmxFMuAbV0qD5EgfbqqJly3Iag0EHDXwaBX5njJBqTrPkFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632271; c=relaxed/simple;
	bh=wTrAS7tVc6ZOhlOM56QJZPhWxxHdm0Fn6WF2kS42hSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JbEUr+eev1rFcW/Ol5VHBUKGxhOU0XT9aID0CcsTNpvO3bcrV38qkKpPzx+DvLmaTSH345JLbUCjy1JE2kdMHvqwLrPjEFKxf0bMoidZbnLrjyNr3D0DFpI9Lo4iojCGj6O/GorFbmqOPC6itW3ynKKtRZDb8IsTU5jje/1VO/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re; spf=pass smtp.mailfrom=buffet.re; dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b=ViTjzwBy; arc=none smtp.client-ip=51.83.41.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b="ViTjzwBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=buffet.re; s=mx1;
	t=1789631944; bh=wTrAS7tVc6ZOhlOM56QJZPhWxxHdm0Fn6WF2kS42hSg=;
	h=From:To:Cc:Subject:Date:From;
	b=ViTjzwByimCfmVPTeN5TJRd1phGD/saoffr/s0Su1rp7Tx5/gjtqeL+ZGDi/F4Hkq
	 z22Fb9c7NqDXhJiS3mNyTmQzHWvzJjt/w7FlPTzBtRX4dfzzpoUtVUlWAD4Rhff2N2
	 DOgXjYKp3IFC88fDUhnUEEoN1Jw9QOJXA4w9p6GBKMfwwSXucnm1KYD8MQN+DHXuxN
	 7D06wR4T0mKPSoEIYC9O0RDmtAQLkRv5CEUUVH2TI/xsRMVaAmsRcU0VTuuNw6k1U5
	 zUUgBWMhTNafyItzyXrcPMmO4o0STTx/XXD4sD4gOleQUD1o5K1KamMVgT8W/MyFPV
	 b2AUJMK/BGPhA==
Received: from localhost.localdomain (unknown [10.0.1.3])
	by mx1.buffet.re (Postfix) with ESMTPSA id 7056812683A;
	Thu, 17 Sep 2026 09:59:04 +0200 (CEST)
From: Matthieu Buffet <matthieu@buffet.re>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Matthieu Buffet <matthieu@buffet.re>
Subject: [PATCH 0/3] Add Landlock UDP support documentation
Date: Thu, 17 Sep 2026 09:58:49 +0200
Message-ID: <20260917075853.10231-1-matthieu@buffet.re>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alejandro, Mickaël, Günther,

Here is a small update to landlock.7 and landlock_add_rule.2 to add
missing TCP info, and add UDP specifics introduced in kernels 7.2+.
With the benefit of hindsight, re-reading UAPI header changes, I
actually did a bit more than copy-pasting from them (see patch 3/3):
- explicitly state in the access right description that sending
  datagrams without a destination does not require any access right
- more importantly: clarify the description of the most non-trivial
  behaviour (auto-bind denials when emitting, which can occur even if
  CONNECT_SEND_UDP is not handled)
Mickaël, if you are okay with these additions, would you like them in a
UAPI header patch to sync the two?

Have a nice day!

Link: <https://github.com/landlock-lsm/linux/issues/66>

Matthieu Buffet (3):
  man/man2/landlock_add_rule.2: Clarify ephemeral port range
  man/man7/landlock.7: Document AF_UNSPEC behaviour and error codes
  man/man7/landlock.7, man/man2/landlock_add_rule.2: Document UDP
    support

 man/man2/landlock_add_rule.2 | 23 +++++++---
 man/man7/landlock.7          | 88 ++++++++++++++++++++++++++++++++++--
 2 files changed, 102 insertions(+), 9 deletions(-)


base-commit: dbc7211e1e52dcd485bd3e081cfa761506edc4e9
-- 
2.47.3

