require 'uri'
require 'yaml'

module FinancialPull
    class FinancialInstitution
        attr :name
        attr :ofx_uri
        attr :ofx_version
        attr :organization_name
        attr :organization_id
        attr :bank_identifier

        def initialize(name, ofx_uri, ofx_version)
            @name = name
            @ofx_uri = ofx_uri
            @ofx_version = ofx_version
        end

        def self.get_institution(name)
            fi = YAML.load_file('config/institutions.yml')[name]
            FinancialInstitution.new(fi['name'],fi['uri'], fi['version'] )
        end

    end

    #     def self.get_institution(financial_institution_name)
    #         case financial_institution_name
    #             when 'Capital One'
    #                 FinancialInstitution.new('Capital One',
    #                                          URI.parse('https://onlinebanking.capitalone.com/scripts/serverext.dll'),
    #                                          OFX::Version.new("1.0.2"))
    #             when 'Citi'
    #                 FinancialInstitution.new('Citi',
    #                                          URI.parse('https://secureofx2.bankhost.com/citi/cgi-forte/ofx_rt?servicename=ofx_rt&pagename=ofx_ruby'),
    #                                          OFX::Version.new("1.0.2"))
    #             else
    #                 raise NotImplementedError
    #         end
    #     end
    #
    #     attr :name
    #     attr :ofx_uri
    #     attr :ofx_version
    #
    #     def initialize(name, ofx_uri, ofx_version)
    #         @name = name
    #         @ofx_uri = ofx_uri
    #         @ofx_version = ofx_version
    #     end
    #
    #     def create_request_document()
    #         document = OFX::Document.new
    #
    #         case ofx_version
    #             when OFX::Version.new("1.0.2")
    #                 document.header.header_version = OFX::Version.new("1.0.0")
    #                 document.header.content_type = "OFXSGML"
    #                 document.header.document_version = OFX::Version.new("1.0.2")
    #             else
    #                 raise NotImplementedError
    #         end
    #
    #         document.header.security = "NONE"
    #
    #         document.header.content_encoding = "USASCII"
    #         document.header.content_character_set = "1252"
    #
    #         document.header.compression = "NONE"
    #
    #         document.header.previous_unique_identifier = "NONE"
    #         document.header.unique_identifier = OFX::FileUniqueIdentifier.new
    #
    #         document
    #     end
    #
    #     def send(document)
    #         serializer = OFX::Serializer.get(@ofx_version)
    #         request_body = serializer.to_http_post_body(document)
    #
    #         client = OFX::HTTPClient.new(@ofx_uri)
    #         response_body = client.send(request_body)
    #
    #         return serializer.from_http_response_body(response_body)
    #     end
    # end
end