	#
# Be sure to run `pod lib lint Centrixlink-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "Centrixlink-iOS"
s.version          = "1.0.61"
s.summary          = "Centrixlink's iOS SDK'"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description      = <<-DESC
An SDK for video ad based monetization with the Centrixlink Network
DESC

s.homepage         = "http://www.Centrixlink.com/"
s.license          = { "type" => "Commercial", "text" => "   \tCentrixlink SDK License and Publisher Terms\n The Centrixlink SDK is made available by Centrixlink, Inc. (\"Centrixlink\"). \n By downloading or using the Centrixlink SDK, you and any company, entity, or organization on behalf of which you are accepting these Centrixlink SDK License and Publisher Terms (this \"Agreement\") hereby agree to be bound by all terms and conditions of this Agreement. If you do not agree to all terms and conditions of this Agreement, do not download or use the Centrixlink SDK. \n If you are downloading or using the Centrixlink SDK on behalf of a company, entity, or organization, then you represent and warrant that you are an authorized representative of such company, entity, or organization with the authority to bind such company, entity, or organization to this Agreement; and agree to be bound by this Agreement on behalf of such company, entity, or organization. You and, if applicable, such company, entity, or organization may be referred to as the \"Developer\". \n Definitions \n \"Developer Apps\" means the mobile applications owned and/or controlled by Developer for which Developer wishes to use the Centrixlink SDK. \n \"Centrixlink Platform\" means Centrixlink’s hosted video advertising system, which supports video advertisement insertion within mobile applications, and related advertisement reporting tools.\n\"Centrixlink SDK\" means the software development kit and any other software that may be provided by Centrixlink to Developer with the software development kit (including any updates to the foregoing).\nCentrixlink SDK License. During the term of this Agreement, Centrixlink hereby grants Developer a worldwide, non-transferable (except for a permitted assignment of this Agreement), non-exclusive license to (a) use the Centrixlink SDK internally for the sole purpose integrating the Centrixlink SDK with Developer Apps, (b) use, reproduce and distribute certain portions of the Centrixlink SDK solely as required for Developer’s distribution of Developer Apps, solely in the manner enabled by Centrixlink and in accordance with any applicable documentation provided by Centrixlink, and provided that any such distribution to an end user is subject to terms at least as protective of the Centrixlink SDK as those set forth herein; (c) use the Centrixlink SDK and Centrixlink Platform to have video advertisements inserted within Developer Apps pursuant to this Agreement and any insertion order entered into between the parties, in the manner enabled by Centrixlink and in accordance with any applicable documentation provided by Centrixlink; and (d) to internally use any provided documentation for the sole purpose of exercising the foregoing licenses.\nLicense Restrictions. Developer has no rights or licenses with respect to the Centrixlink SDK or any documentation (collectively, the \"Centrixlink Materials\") except as expressly provided in this Agreement. Without limiting the generality of the foregoing, except as expressly provided in this Agreement, Developer may not (a) copy, distribute, rent, lease, lend, sublicense, transfer or make the Centrixlink Materials available to any third party or use the Centrixlink Materials on a service bureau basis, (b) decompile, reverse engineer, or disassemble the Centrixlink Materials, (c) create derivative works based on the Centrixlink Materials; or (d) modify, remove, or obscure any copyright, trademark, patent or other notices or legends that appear on the Centrixlink Materials or during the use and operation thereof.\nInsertion of Advertising. Centrixlink and Developer agree that any insertion order agreed to by the parties for the serving and insertion of advertisements from the Centrixlink Platform to or through the Developer Apps shall be subject to the terms and conditions of Exhibit A.\nOwnership \n\nCentrixlink Rights. As between Centrixlink and Developer, Centrixlink retains all right, title and interest in and to the Centrixlink Platform, the Centrixlink Materials and any materials created, developed or provided by Centrixlink in connection with this Agreement, including all intellectual property rights related to each of the foregoing. All rights not expressly granted by Centrixlink to Developer herein are hereby reserved by Centrixlink.\nDeveloper Rights. Subject to Section 5.1, as between Developer and Centrixlink, Developer retains all right, title and interest in and to the Developer Apps, including all intellectual property rights related to each of the foregoing. All rights not expressly granted by Developer to Centrixlink herein are hereby reserved by Developer.\nCollection of Unique Identifiers. Developer acknowledges that unique identifiers and other technologies may be used in connection with the Centrixlink SDK and Centrixlink Advertisements in order to collect and use data regarding advertisement performance and end user interests and to display Centrixlink Advertisments to end users, and that the collection of such data is regulated by the Children's Online Privacy Protection Act, 15 U.S.C. §§ 6501-6506 and the Federal Trade Commission's COPPA Rule, 16 C.F.R. Part 312 (collectively, \"COPPA\") and other applicable laws. Centrixlink will collect and use such unique identifiers in accordance with the Centrixlink Privacy Policy, which is available at http://www.Centrixlink.com/privacy.html (as updated from time to time) and incorporated by reference into this Agreement.\nCompliance with Laws. Developer acknowledges and agrees that Centrixlink may collect unique identifiers from end users via the Centrixlink SDK and use them in accordance with the Centrixlink Privacy Policy. Developer further acknowledges and agrees that it is responsible for providing adequate notice and obtaining any required end user or parental consent, including as required by the Children's Online Privacy Protection Act, 15 U.S.C. §§ 6501-6506 and the Federal Trade Commission's COPPA Rule, 16 C.F.R. Part 312 (collectively, \"COPPA\"), to the collection of unique identifiers and other information via the Centrixlink SDK and Developer's App. Developer expressly represents, warrants and covenants that it and its App shall fully comply with, and Developer shall ensure that the collection of unique identifiers and other information by the Centrixlink SDK as set forth in the Centrixlink Privacy Policy (as amended from time to time) complies with, COPPA and all other applicable laws, rules and regulations. For the avoidance of doubt, as between Centrixlink and Developer, Developer shall be responsible for ensuring that Developer's App, and the information collected from end users of Developer's App (including by the Centrixlink SDK), complies with COPPA and all applicable laws, rules and regulations. Developer shall fully indemnify, defend, and hold harmless Centrixlink and its directors, officers, agents, representatives, assigns, and employees from and against any liabilities, damages, costs, fines, penalties and expenses (including reasonable attorneys’ fees) arising out of or relating to a violation of this paragraph 7 and/or any claims of COPPA violations or other violations of laws relating to Developers Apps.\nSupport.\n  Centrixlink shall have no obligation under this Agreement to provide any upgrades, patches, enhancements, fixes or any other support for the Centrixlink Platform or Centrixlink Materials. Centrixlink may make maintenance and support services available under a separate agreement.\nTerm and Termination. \n \nTerm. This Agreement is effective until terminated. \n \nTermination by Centrixlink. Centrixlink may terminate this Agreement at any time by providing sixty (60) days’ notice to Developer.Additionally, Centrixlink may terminate this Agreement and the licenses granted herein immediately if Developer breaches any provision of this Agreement.\nTermination by Developer. Developer may terminate this Agreement and the licenses granted herein at any time by ceasing all use of the Centrixlink Platform and Centrixlink Materials and destroying or removing from all hard drives, networks, and other storage media all copies of the Centrixlink Materials.\nEffect of Termination. Sections 3, 4, 5, 7.4, and 8 through 12 shall survive any expiration or termination of this Agreement. \n Confidentiality \n\nDefinition. \"Confidential Information\" means any and all information disclosed by Centrixlink to Developer, either directly or indirectly, in writing, orally or by inspection of tangible objects, including without limitation the Centrixlink SDK, the features and functionality of the Centrixlink Platform and the results and performance of the Centrixlink Materials. Confidential Information does not include information that: (i) is or becomes generally known to the public through no fault of or breach of this Agreement by Developer; (ii) is rightfully known by Developer at the time of disclosure without an obligation of confidentiality; or (iii) Developer rightfully obtains from a third party without restriction on use or disclosure.\nUse and Disclosure Restrictions. Developer shall not use the Confidential Information except as necessary to exercise its rights or perform its obligations under this Agreement. Developer shall not disclose the Confidential Information to any third party except to those of its employees, subcontractors, and advisers that need to know such Confidential Information for the purposes of this Agreement, provided that each such employee and subcontractor is subject to a written agreement that includes binding use and disclosure restrictions that are at least as protective of Confidential Information as those set forth herein. Developer will use at least the efforts Developer ordinarily uses with respect to its own proprietary information of similar nature and importance to maintain the confidentiality of all Confidential Information in its possession or control, but in no event less than reasonable efforts. The foregoing obligations will not restrict Developer from disclosing Confidential Information pursuant to the order or requirement of a court, administrative agency, or other governmental body, provided that Developer gives reasonable notice to Centrixlink to contest such order or requirement.\nWarranty Disclaimer. EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, Centrixlink DOES NOT MAKE ANY WARRANTIES, EXPRESS, IMPLIED, STATUTORY OR OTHERWISE, WITH RESPECT TO THE SUBJECT MATTER OF THIS AGREEMENT, AND Centrixlink EXPRESSLY DISCLAIMS THE IMPLIED WARRANTIES OF MERCHANTABILITY, NONINFRINGEMENT, FITNESS FOR A PARTICULAR PURPOSE, AND ANY IMPLIED WARRANTIES ARISING FROM COURSE OF DEALING OR PERFORMANCE. Centrixlink AND ITS SUPPLIERS, LICENSORS, AND PARTNERS DO NOT WARRANT THAT THE Centrixlink PLATFORM OR Centrixlink SDK WILL BE CORRECT, UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE CORRECTED, OR THAT THE Centrixlink PLATFORM OR Centrixlink SDK ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. Centrixlink DOES NOT WARRANT THE RESULTS OF USE OF THE Centrixlink PLATFORM OR Centrixlink SDK. DEVELOPER ACKNOWLEDGES THAT Centrixlink MAY MODIFY OR SUSPEND THE Centrixlink PLATFORM AT ANY TIME IN ITS SOLE DISCRETION AND WITHOUT NOTICE.\nIndemnification. Developer agrees to indemnify, defend, and hold harmless Centrixlink and its directors, officers, and employees from and against any liabilities, damages, costs and expenses (including reasonable attorneys’ fees) arising out of any claim, demand, action, or proceeding initiated by a third party to the extent attributable to the alleged or actual breach of Developer’s obligations, representations or warranties set forth in this Agreement, provided that Centrixlink: (a) promptly notifies Developer in writing of the claim, except that any failure to provide this notice promptly only relieves Developer of its responsibility pursuant to this Section 10 to the extent its defense is materially prejudiced by the delay; (b) grants Developer sole control of the defense and/or settlement of the claim; and (c) provides Developer, at Developer’s expense, with all assistance, information and authority reasonably required for the defense and/or settlement of the claim, but in a manner consistent with Centrixlink’s respective confidentiality obligations and preservation of attorney/client, work product, and other privileges.\nLimitation of Liability. Centrixlink SHALL NOT BE LIABLE TO DEVELOPER FOR ANY PUNITIVE, INCIDENTAL, INDIRECT, SPECIAL, RELIANCE OR CONSEQUENTIAL DAMAGES, INCLUDING LOST BUSINESS, REVENUE, OR ANTICIPATED PROFITS, WHETHER BASED ON BREACH OF CONTRACT, TORT (INCLUDING NEGLIGENCE), OR OTHERWISE, AND WHETHER OR NOT Centrixlink WAS ADVISED OF THE POSSIBILITY OF SUCH LOSS OR DAMAGES. IN NO EVENT WILL Centrixlink’S AGGREGATE LIABILITY UNDER THIS AGREEMENT EXCEED THE GREATER OF ONE HUNDRED DOLLARS ($100) AND THE TOTAL FEES PAYABLE TO DEVELOPER UNDER THIS AGREEMENT DURING THE TWELVE MONTHS IMMEDIATELY PRECEDING THE DATE THE CLAIM FIRST AROSE. THE PARTIES AGREE THAT THE LIMITATIONS OF LIABILITY SET FORTH IN THIS SECTION WILL APPLY EVEN IF ANY LIMITED REMEDY SPECIFIED IN THIS AGREEMENT IS FOUND TO HAVE FAILED OF ITS ESSENTIAL PURPOSE.\nGeneral \n \nRelationship of the Parties. The parties are independent contractors with respect to each other. This Agreement does not constitute and shall not be construed as constituting a partnership or joint venture among the parties hereto, or an employee-employer relationship. No party shall have any right to obligate or bind any other party in any manner whatsoever, and nothing herein contained shall give, or is intended to give, any rights of any kind to any third parties.\nAssignment. Neither party may assign any of its rights or obligations under this Agreement without the prior written consent of the other party, except that either party may assign its rights and obligations under this Agreement without the consent of the other party in connection with any merger (by operation of law or otherwise), consolidation, reorganization, change in control or sale of all or substantially all of its assets related to this Agreement or similar transaction. This Agreement inures to the benefit of and shall be binding on the parties’ permitted assignees, transferees and successors.\nForce Majeure. Neither party will be responsible for any failure or delay in its performance under this Agreement due to causes beyond its reasonable control, including, but not limited to, labor disputes, strikes, lockouts, internet or telecommunications failures, shortages of or inability to obtain labor, energy, or supplies, war, terrorism, riot, acts of God or governmental action, acts by hackers or other malicious third parties and problems with the Internet generally, and such performance shall be excused to the extent that it is prevented or delayed by reason of any of the foregoing.\nHeadings and Wording. Unless otherwise expressly stated in this Agreement, the words \"herein,\" \"hereof,\" \"hereto,\" and \"hereunder\" and other words of similar import refer to this Agreement as a whole and not to any particular Article, Section, Subsection, or other subdivision. The words \"include\" and \"including\" are not and should not be construed or interpreted as terms of limitation. The words \"day,\" \"month,\" and \"year\" mean, respectively, calendar day, calendar month, and calendar year. Section headings are for reference purposes only, and should not be used in the interpretation hereof. No provision of this Agreement will be construed against either party as the drafter thereof.\nNotices. All notices under the terms of this Agreement shall be given in writing and sent by registered mail, internationally recognized carrier, or facsimile transmission with machine confirmation or shall be delivered by hand.\nAmendments. An amendment of this Agreement shall be binding upon the parties so long as it is either in writing and executed by both parties or is presented by Centrixlink electronically via the Centrixlink Platform and accepted by Developer by clicking on \"I Accept\" or similar language.\nWaiver. A waiver of any provision of this Agreement will only be valid if provided in writing and will only be applicable to the specific incident and occurrence so waived. The failure by either party to insist upon the strict performance of this Agreement, or to exercise any term hereof, will not act as a waiver of any right, promise or term, which will continue in full force and effect.\nConstruction. This Agreement shall be fairly interpreted and construed in accordance with its terms and without strict interpretation or construction in favor of or against either party.\nSeverability. If any provision, or portion thereof, of this Agreement is determined by a court of competent jurisdiction to be invalid, illegal or unenforceable, such determination will not impair or affect the validity, legality, or enforceability of the remaining provisions of this Agreement, and each provision, or portion thereof, is hereby declared to be separate, severable, and distinct.\nGoverning Law; Jurisdiction. This Agreement shall be governed by, and construed in accordance with, the laws of the State of California, without reference to conflicts of laws principles. The parties agree that the federal and state courts in San Francisco County, California will have exclusive jurisdiction and venue under this Agreement, and the parties hereby agree to submit to such jurisdiction exclusively.\nEntire Agreement. This Agreement, together with the Exhibits attached hereto and hereby incorporated herein by reference, constitutes the complete, final and exclusive agreement between the parties with respect to the subject matter hereof, and supersedes any and all prior or contemporaneous oral or written representations, understandings, agreements or communications between them concerning the subject matter hereof. Neither party is relying upon any warranties, representations, assurances or inducements not expressly set forth herein.\n\nExhibit A \n \n\nAdvertising Insertion Order Terms \n \nDefinitions \n\n\"Advertisers\" means third-party advertisers.\n\"Content\" means any content or materials\navailable in, distributed with, or that otherwise may be viewed or downloaded by end users of the Developer Apps (excluding Centrixlink Advertisements).\n\"CPM\" means the cost per thousand advertisement impressions.\n\"Net Revenue\" means the gross revenue actually collected by Centrixlink from Advertisers for Centrixlink Advertisements, less (i) any refunds to Advertisers; (ii) a deduction of 10% to cover expenses related to discounts, payment transaction fees, telecommunications, data center and other serving costs, ; (iii) any amounts payable by Centrixlink to providers of targeting, reporting, verification or other data, technology or services used in connection with a given advertisement campaign hereunder.\n\"Centrixlink Advertisements\" means video advertisements, sourced by or on behalf of Centrixlink, which are routed and/or served by the Centrixlink Platform to the Developer Apps.\nCentrixlink Advertisement Sales. Upon agreement between Developer and Centrixlink on an insertion order for the placement of Centrixlink Advertisements in Developer Apps, Developer hereby grants Centrixlink the right to sell and have sold advertisement inventory in the Developer Apps and to insert Centrixlink Advertisements within such inventory during the term of the applicable insertion order, including the right to list such inventory in pitch materials to prospective Advertisers and to report such inventory as being part of Centrixlink’s advertising network. In addition, Developer hereby grants Centrixlink a nonexclusive license during the term of this Agreement to use Developer’s trademarks and logos and images of the Developer Apps in connection with exercising the foregoing right. Centrixlink is solely responsible for, and has final authority on, decisions related on how to sell Centrixlink Advertisement inventory, including packaging, pricing, promotional offers, and all other related deal terms and conditions. Developer shall designate a representative that will serve as the point of contact on an ongoing basis with Centrixlink’s account management team.\nDeveloper Permissions. Developer agrees that, in connection with fulfillment of any insertion order entered into between the parties, Centrixlink may: (a) access or call to the Developer Apps or the servers that make them available and to cause the routing, transmission, reproduction, and display of Centrixlink Advertisements as contemplated herein; and (b) collect data and information, including unique identifiers, usage data, and streaming data, with regard to the Content and Developer Apps within which Centrixlink Advertisements are routed and/or served and (i) use such information for Centrixlink’s internal business purposes; (ii) disclose such information to third parties (including Advertisers and partners) as reasonably necessary in connection with the operation of the Centrixlink Platform or as may be required by law or legal process; and (iii) disclose such information generally when it is aggregated with similar information relating to other Centrixlink publishers such that the specific information relating to Developer is not identified as such.\nRepresentations and Warranties of Developer. During the term of this Agreement, Developer represents, warrants and covenants to Centrixlink that: (a) it has all necessary rights, title, and interest in and to the Developer Apps to allow Centrixlink to insert Centrixlink Advertisements as contemplated herein; (b) it shall not use the Centrixlink Materials in connection with any Developer Apps, Content or technology that violate any law, rule or regulation, including without limitation applicable FTC regulations and COPPA; (c) it has any and all consents, authorizations and clearances from end users of the Developer Apps as may be required for Centrixlink to provide services hereunder; and (d) the Developer Apps do not and will not (i) infringe upon, violate, or misappropriate any third-party right, including any copyright, trademark, patent, trade secret, moral right, privacy right, right of publicity, or any other intellectual property or proprietary right or (ii) slander, defame, or libel any person.\n<\nRestrictions. Developer may not, and may not authorize or encourage any third party to: (i) generate fraudulent impressions of or fraudulent clicks on any advertisements, including through repeated manual clicks, the use of robots or other automated tools or any other method that may lead to artificially high numbers of impressions, downloads, or clicks; (ii) edit, modify, filter, or change the order of the information contained in any Centrixlink Advertisement, or remove, obscure or minimize any Centrixlink Advertisement in any way; and (iii) redirect an end user away from any web page accessed by an end user after selecting or clicking on any part of a Centrixlink Advertisement (\"Advertiser Page\"), provide a version of the Advertiser Page different from the page an end user would access by going directly to the Advertiser Page, or intersperse any content between the Centrixlink Advertisement and the Advertiser Page. Centrixlink may suspend Developer’s use of the Centrixlink Platform and/or terminate this Agreement immediately should Developer violate the foregoing provisions of this Section 5.\nContent. Developer acknowledges and agrees that it may not use the Centrixlink Platform in connection with any Developer Apps or Content containing, consisting of or promoting discrimination, illegal activities, hate speech, graphic violence, firearms, tobacco, illegal drugs, pornography, profanity, obscenity or sexually explicit material, and that it will notify Centrixlink immediately of any Developer Apps or Content relating to alcohol or gambling. Developer agrees that Centrixlink has no responsibility for any Content, and Centrixlink has no obligation or ability to monitor or edit the Developer Apps. Developer agrees to provide as much advance notice as is reasonably practicable (but in no event less than fifteen (15) days’ notice) regarding any material changes to the nature or design of any Developer App, including without limitation changes to the placement of Centrixlink Advertisement inventory, the type of Content, or the target audience.\nTracking Data. Developer acknowledges that unique identifiers and other technologies may be used in connection with the Centrixlink SDK Centrixlink Advertisements in order to collect and use data regarding advertisement performance and end user interests and to display Centrixlink Advertisements to end users, and that the collection of such data is regulated by the Children's Online Privacy Protection Act, 15 U.S.C. §§ 6501-6506 and the Federal Trade Commission's COPPA Rule, 16 C.F.R. Part 312 (collectively, \"COPPA\"). Developer hereby grants Centrixlink a perpetual, irrevocable, worldwide, sublicenseable right and license to ussde, copy, modify, distribute and otherwise exploit data collected through such cookies, beacons, and other technologies for Centrixlink’s business purposes. Without limiting any other terms of the Agreement or (including paragraphs 6 and 7) and this Exhibit A, during the term of this Agreement, Developer shall obtain all consents, authorizations and clearances from end users of the Developer Apps required in connection with the use of such cookies, beacons, and other technologies. Developer shall provide or make available to users of each Developer App a privacy notification in a conspicuous manner (via a privacy policy or other method appropriate for the type of such Developer App)which (i) complies with all applicable laws, rules and regulations; and (ii) to the extent applicable to the type of such Developer App, discloses to users of such Developer App that cookies, web beacons and other technologies may be used in connection with such Developer App. Developer shall comply with such other requirements that Centrixlink may issue in writing from time to time (including through the Centrixlink Platform) that relate to compliance with laws, rules, regulations, guidelines and industry standards relating to online advertising.\nPayment Amounts. Subject to the terms and conditions of this Agreement, Centrixlink shall pay to Developer amounts calculated in accordance with the applicable insertion order entered into between the parties and the definitions of CPM and Net Revenue set forth herein. Developer acknowledges that all payments hereunder shall be based on the impression counts used by the applicable Advertisers to pay Centrixlink. For the avoidance of doubt, all payments hereunder are based on advertisement requests from the Developer Apps that are actually fulfilled with a Centrixlink Advertisement, except as expressly provided in this Agreement. All amounts received from activities Centrixlink deems to be fraudulent may be refunded to Advertisers in Centrixlink’s sole discretion.\nPayment Terms. Centrixlink agrees to pay all amounts due hereunder within 60 days after the last day of the month in which Centrixlink received the corresponding payment from the Advertiser, provided that no check will be issued for any amount less than $50 U.S. If there are any payment fees from the receiving bank, immediate bank or from paypal, Developer will be responsible for these fees. All unpaid earnings will rollover to the next pay period. All payments will be made in U.S. dollars ($U.S.). Centrixlink may deduct from such payments any withholding, sales, value added, and other applicable taxes (other than its net income taxes) which Centrixlink is required by law to deduct. Developer is responsible for paying any other taxes, duties, or fees for which Developer is legally responsible.\n \n" }
s.author           = { "Centrixlink" => "tech-support@Centrixlink.com" }

s.platform     = :ios, '7.0'
s.requires_arc = true

s.source           = { :git => "https://github.com/Centrixlink/Centrixlink-iOS-SDK.git", :tag => "1.0.61" }
s.vendored_frameworks = 'Centrixlink.embeddedframework/Centrixlink.framework'
s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }

s.frameworks = 'AdSupport', 'AudioToolbox', 'AVFoundation', 'CFNetwork', 'Foundation', 'MediaPlayer', 'StoreKit', 'SystemConfiguration', 'UIKit'
s.libraries = 'z', 'stdc++'
end