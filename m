Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30868439357
	for <linux-man@vger.kernel.org>; Thu, 30 Jul 2026 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418658; cv=pass; b=IcbU4ry5UDEp/3yDgiZcpkG3EJ1wZj2zZiWvv3oFvtD6BdI2SQLLbKwhW3Hpx7eJPuyobNlZjAFhq1CNIrLO2EL7btVzOWVmgvO0nmwJv23Msx9khVxlTAGyLLGiWKf5ZWy4oOlgiAlYgJVWozfTP0NNm/rLH0ssEKATXPBBE44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418658; c=relaxed/simple;
	bh=ugKQzpv4h/qIdFsMk8eIztmh3xmK7QRgP+dehd6B6+U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=n0HsfgFbkuoL3jqHZPXF9jRNxVccCqshPFbNrLJCCV+rmBF60GvFeyFc5JbYJS129YgU/kXug5VunBEJKWkbJM+pWkuQLq7FAwSLDfvG3emtF+GOFoTuqM77U9ZeUoeJHfetQrv+MxP9u2cfLizZUyqI52K+iSdxrrA+iy/78sA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mightymoms.net; spf=pass smtp.mailfrom=mightymoms.net; dkim=pass (2048-bit key) header.d=mightymoms-net.20251104.gappssmtp.com header.i=@mightymoms-net.20251104.gappssmtp.com header.b=Bvl44XgZ; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mightymoms.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mightymoms.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mightymoms-net.20251104.gappssmtp.com header.i=@mightymoms-net.20251104.gappssmtp.com header.b="Bvl44XgZ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca88130e09aso1485898a12.3
        for <linux-man@vger.kernel.org>; Thu, 30 Jul 2026 06:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785418654; cv=none;
        d=google.com; s=arc-20260327;
        b=MO+857t3RsiVa4NEYm3w9cHiNpG9GwIZyqpS+QZp3roWb4bJc2YDUJQrBSA4EezHEF
         XEzRa2XAKQ8q+b1ScjTAwEJXIR1a7zc1gGXMDOWhWoKhUatO2j2jfzE1eaKBUpGHQz+b
         PO3wEmlV3pK65SdHa5E1RGu3REQHGR6n4hdZnNn1LET4YMV/5wCpehePcyIKC4oypHUH
         KVr/zTgWu6kSAsIZTiIwQyo7ZmiexFq4zpYx+4W/vCX/67BVQBIx1jcE41lVNWvW486X
         3qBa5d4RzgAXjcE0IYiEpEqhRzGjAKqAsY+hLsQgm25dYUpmTT0i0xYmaGExUuJNp+64
         SV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=ugKQzpv4h/qIdFsMk8eIztmh3xmK7QRgP+dehd6B6+U=;
        fh=OclAtLKJTQTIvPXBcbgjquIcuF1L0TED2I15vb2Dds8=;
        b=rTUrTZdVOfOrmYkhzpG2oSfQlXZE0zduQGng60nQuwmOI6EvEaUzpqGH5WIQDIapq3
         mNpGBonatcTquhFTmUmF99I8li7XvM9m9Ob8ji+yMCvY6F9NtuCtsJ3vjiNJJuvKCuOX
         OB/wL9Eep4AGvfZgJGVV8gxzDtekgVHDcAPrkOU2BxViyaIC2zl1gTKhJaUFllpHDo9E
         /X+FnS2VZd32/Fz83Jwsu/IJ64HR6I3bi9wHwudpLGtdhy1vyIKB34LMPSyIpZaqgT41
         fUhVdStNiROfkFBLSvSYgfpq2NZDoGnlLfhdf79fwh0uj4nvSQpcbr70/DeZIH4NQTnW
         y95g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mightymoms-net.20251104.gappssmtp.com; s=20251104; t=1785418654; x=1786023454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugKQzpv4h/qIdFsMk8eIztmh3xmK7QRgP+dehd6B6+U=;
        b=Bvl44XgZ3nEzDGewOEsGF1x5/M1c4ScqFtjtnIPp6Q2FGnKenLggOG4ofkKOBu2KB6
         qP60bC45sfGpdqge1srTDSlndFiImh1eJz1xlsqcIDICAjk+rwOVQDMijIHVFP3DyG9z
         neT7fDSz24VllcI9fE5EbfcD2PeLqgjs6bWEI0tg0nQl6fGIIyFMctDZELEqOFVg+1dv
         Duv0HoAhDz42BDYOpWpfMO30Ra7oyygQBgKa5TmBSqE+x7EsQbGuIXwSiamSAHh9/euJ
         wvDCUOEkLJHkrPaJvhCzUm85VydR/v1fRmzwSp/MoWj+PJwU2EtvcpRP5DPGQN5YgLMS
         +8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418654; x=1786023454;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ugKQzpv4h/qIdFsMk8eIztmh3xmK7QRgP+dehd6B6+U=;
        b=gzT+BP/uoqXUAB2Ds71+CQTLCBYNvjJeLGc6988WgTgsDNR1JZncdizb3/LuHv/ito
         Lexb4i78hcL2XMFBuEofaqQXFwM9co60O9NWr3ii8E/0OHRyN9MocR3PGphF/Se30rsC
         cDPjx3IOr8MtnuPzoJ26GBz6boNLfyWdWfEPdO4edkKr8iEepjQF7jlXuQ0w5mnBrEm5
         l4TE2G+XANxWPWI1WN0tefTIiFkxUEk+0RRo9biurWAx69Eikh2TYcUriFyMvqXFAEpz
         xjY9QWevQfm0LNuGxwibFzt29xX2frkyklux4zmpJ2m9cEZiRr1cWRBPAZCZrTElwgym
         ylVA==
X-Gm-Message-State: AOJu0Yw5uGTDnjaXE8OsJ6QL1HrQT8oz6UaPlAIgThqf/okG7NvREHz+
	o3Il1FOeCDYvyx/nGpV0eyHZmbc/aVQfdh1YuyZ3O1dp3yfk6oTOv/MoHt88xtYY4KtKlZGIY0G
	+DZi/ieuBfKvJWqZ1Gejr6nUi5ql9+WZ3tYG+3tvHXlq1wd0Ey35L
X-Gm-Gg: AR+sD10KXTXalNcNUHXqsNiWfS0GOisNn0q3dF8j5+Utn28m27oBPGXFGrKPCaAWrNC
	TjROpNaHAktitomYfS87e6QRmHxBeHYe9wuFeSZ0PrjYZEl0EnKkCDN+mF0zE+dcQqeDFwxLKu/
	33vnClfGQm47FIzK5gnMdNX6YsNqKsxwGquWPIv97ZpUJqn7yIUy5CuqssStcpdAGbbSVpM10nv
	Zq5B2Zgq9f5TLgUJABCdvPFlYosRfGzVvo9tj1yTbAQFfN2IVisL/q1E88LIDk5jCoU2nQZ4EkR
	kqCziNFhjdE/AZKzqcIUwul6ouX4x1W4rbn0CHMvRFrxwkQmcrDUZq10qYdASvO/GJWXI88L4A=
	=
X-Received: by 2002:a05:6a20:93a1:b0:3b4:870e:6f44 with SMTP id
 adf61e73a8af0-3c9007f3948mr2678608637.35.1785418654083; Thu, 30 Jul 2026
 06:37:34 -0700 (PDT)
Received: from 316179279012 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 06:37:33 -0700
Received: from 316179279012 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 06:37:33 -0700
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Emily Graham <info@mightymoms.net>
Date: Thu, 30 Jul 2026 06:37:33 -0700
X-Gm-Features: AUfX_mysOuHCKSGu2HB7uDhQ9BbDt6kc0x1E1-bHbMmkB55ST8Lh6q3JIoePITY
Message-ID: <CAHSkfrF54RTiykAz9rY++u=DtjQizZreZ-ukEfQ+f5idkZSDsQ@mail.gmail.com>
Subject: Could This Blog Post Work for Your Site?
To: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Is your child struggling with a particular subject, or are you simply
looking for ways to expand their knowledge beyond the classroom?
Learning doesn=E2=80=99t have to be limited to school=E2=80=94there are cou=
ntless
opportunities to support your child=E2=80=99s growth with fun and engaging
activities at home and in everyday life.

I=E2=80=99d love to put together an article for your site that shares speci=
fic
tactics and activities to boost your child=E2=80=99s learning outside the
classroom. From hands-on projects to real-world applications, these
strategies can help children grasp challenging subjects and deepen
their understanding in a way that=E2=80=99s both effective and enjoyable.

Would you be interested in reviewing this piece and considering it for
publication on your website? I=E2=80=99d love to hear your thoughts!

Thank you!
Emily Graham of Mightymoms.net


=EF=BD=9EInterested in my guest post proposal, just not on the topic I
mentioned? That=E2=80=99s not a problem! Kindly reply to let me know and we
can come up with an alternative topic. I put effort into making
content that people actually want to read and that smart tools can
easily surface.
