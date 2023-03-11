Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB150C74A5B
	for <linux-man@archiver.kernel.org>; Sat, 11 Mar 2023 17:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCKROF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Mar 2023 12:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjCKROD (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Mar 2023 12:14:03 -0500
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E296A39BA1
        for <linux-man@vger.kernel.org>; Sat, 11 Mar 2023 09:14:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E541A9.00000000640CB6D7.000013B6; Sat, 11 Mar 2023 18:13:59 +0100
Date:   Sat, 11 Mar 2023 18:13:59 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page charsets.7
Message-ID: <20230311171359.GA5028@Debian-50-lenny-64-minimal>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Without further ado, the following was found:

Issue:    ISO 2375 → ISO/IEC 2375

"A 94-character set is designated as GI<n> character set by an escape "
"sequence ESC ( xx (for G0), ESC ) xx (for G1), ESC * xx (for G2), ESC + xx "
"(for G3), where xx is a symbol or a pair of symbols found in the ISO 2375 "
"International Register of Coded Character Sets.  For example, ESC ( @ "
"selects the ISO 646 character set as G0, ESC ( A selects the UK standard "
"character set (with pound instead of number sign), ESC ( B selects ASCII "
"(with dollar instead of currency sign), ESC ( M selects a character set for "
"African languages, ESC ( ! A selects the Cuban character set, and so on."
msgstr ""
"Ein 94-Zeichen Satz wird durch eine Escape-Sequenz ESC ( xx (für G0), ESC ) "
"xx (für G1), ESC * xx (für G2), ESC + xx (für G3) bezeichnet, wobei xx ein "
"im internationalen Register von kodierten Zeichensätzen in ISO/IEC 2375 "
"gefundenes Symbol oder ein Paar von Symbolen ist. Beispielsweise wählt ESC "
"( @ den ISO-646-Zeichensatz als G0, ESC ( A wählt den UK-Standardzeichensatz "
"(mit Pfundzeichen statt des Nummernzeichens), ESC ( B wählt ASCII (mit "
"Dollarzeichen anstelle des Währungszeichens), ESC ( M wählt einen "
"Zeichensatz für afrikanische Sprachen ESC ( ! A wählt den kubanischen "
"Zeichensatz und so weiter."
